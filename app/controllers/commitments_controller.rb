class CommitmentsController < ApplicationController
  require 'open-uri'
  def index
    # @commitments = policy_scope(Commitment)
    @commitments = Commitment.all
    filters = params[:filters]
    if filters
      @period = filters[:period]
      @status = filters[:status]
      @user = filters[:user]
      if @period == "Mois précédent"
        @commitments = @commitments.previous_month
      elsif @period == "Mois suivant"
        @commitments = @commitments.next_month
      elsif @period == "Mois en cours"
        @commitments = @commitments.current_month
      elsif @period == "Comul annuel"
        @commitments = @commitments.year_to_date
      elsif @period == "Toutes périodes"
        @commitments = @commitments
      elsif @status == "Facture en attente"
        @commitments = @commitments.where(status: "Facture en attente")
      elsif @status == "Paiement en attente"
        @commitments = @commitments.where(status: "Paiement en attente")
      elsif @status == "Payé"
        @commitments = @commitments.where(status: "Payé")
      elsif filters[:user]
        @commitments = @commitments.where(user_id: filters[:user])
      end
    end
  end

  def show
    @commitment = Commitment.find(params[:id])
    authorize @commitment
  end

  def new
    @supplier = Supplier.new
    @commitment = Commitment.new
    authorize @commitment
    authorize @supplier
  end

  def create
    @commitment = Commitment.new(commitment_params)
    @commitment.user = current_user
    @commitment.status = "Paiement en attente" if @commitment.invoice? && @commitment.status == "Facture en attente"
    @organization = current_user.organization
    @commitments = Commitment.count
    @commitment.order_ref = "PO-2018-#{@commitments + 1}"
    @commitment_with_invoices = Commitment.select{|commitment| commitment.invoice?}.count
    @commitment.invoice_ref = "AC-#{@commitment_with_invoices + 1}"
    if @commitment.save
      redirect_to commitment_path(@commitment)
    else
      @supplier = Supplier.new
      render :new
    end
    authorize @commitment
  end

  def edit
    @supplier = Supplier.new
    @commitment = Commitment.find(params[:id])
    authorize @commitment
    authorize @supplier
  end

  def update
    @commitment = Commitment.find(params[:id])
    @organization = current_user.organization
    @commitment_with_invoices = Commitment.select{|commitment| commitment.invoice?}.count
    @commitment.invoice_ref? ? @commitment.invoice_ref : @commitment.invoice_ref = "AC-#{@commitment_with_invoices + 1}"
    @commitment.update(commitment_params)
    @commitment.status = "Paiement en attente" if @commitment.invoice? && @commitment.status == "Facture en attente"
    @commitment.save
    authorize @commitment
    redirect_to commitment_path(@commitment)
  end

  def download_file
    @commitment = Commitment.find(params[:id])
    send_file(
      # "#{Rails.root}/public/uploads/commitment/invoice/#{@commitment.id}/#{@commitment.invoice}",
      "#{Rails.root}/public/#{@commitment.invoice}",
      filename: "#{@commitment.invoice.file.identifier}",
      type: "application/jpg"
    )
  end

  def pre_closing
    @to_be_processed = Commitment.previous_month.where(status: "Facture en attente").or(Commitment.previous_month.where(status: "Paiement en attente", recurrence: "Ponctuel"))
    @processed = Commitment.previous_month.where(status: "Paiement en attente", recurrence: "Mensuel").or(Commitment.previous_month.where(status: "Payé", recurrence: "Ponctuel")).or(Commitment.current_month.where(status: "Reporter", recurrence: "Ponctuel"))
  end

  def commitment_payment_proceed
    @commitment = Commitment.find(params[:commitment_id])
    @commitment.update(status: 'Payé')
    redirect_to pre_closing_path
  end

  def commitment_postpone
    @commitment = Commitment.find(params[:commitment_id])
    @commitment.update(status: 'Reporter', due_date: @commitment.due_date >> 1)
    redirect_to pre_closing_path
  end

  def closing
    @processed = Commitment.previous_month.where(status: "Paiement en attente", recurrence: "Mensuel")
    @processed.each do |monthly_commitment|
      monthly_commitment.status = "Payé"
      monthly_commitment.save!
      new_commitment = monthly_commitment.dup
      new_commitment.status = "Facture en attente"
      new_commitment.due_date = monthly_commitment.due_date >> 1
      new_commitment.invoice = nil
      new_commitment.save!
    end
    # @processed_one_off = Commitment.previous_month.where(status: "Pending invoice", recurrence: "One off")
    # @processed_one_off.each do |one_off_commit_without_invoice_but_processed|
    #   new_commitment = one_off_commit_without_invoice_but_processed.dup
    #   new_commitment.due_date = one_off_commit_without_invoice_but_processed.due_date >> 1
    #   new_commitment.save!
    # end
  end

  def zip_and_download_files
    @commitments = Commitment.all
    @cloud_ids = []
    @commitments.each do |commitment|
      @cloud_ids << commitment.invoice.file.public_id if commitment.invoice.present?
    end
    result = Cloudinary::Utils.download_zip_url(public_ids: @cloud_ids)
    # redirect_to commitments_path
  end

  private

  def commitment_params
    params.require(:commitment).permit(:title, :amount, :description, :due_date, :payment_date, :status, :recurrence, :supplier_id, :retrieval_mode, :payment_method, :invoice)
  end
end












