class CommitmentsController < ApplicationController
  require 'json'
  require 'open-uri'
  def index
    # @commitments = policy_scope(Commitment)
    zip

    @commitments = Commitment.all
    filters = params[:filters]
    # @organization_users = current_user.organization.users
    if filters
      unless filters[:user] == "Tous"
        @user = User.find_by(email: filters[:user])
        @commitments = Commitment.where(user: @user)
      end

      @period = filters[:period]
      case @period
      when "Mois précédent"
        @commitments = @commitments.previous_month
      when "Mois suivant"
        @commitments = @commitments.next_month
      when "Mois en cours"
        @commitments = @commitments.current_month
      when "Cumul annuel"
        @commitments = @commitments.year_to_date
      when "Toutes périodes"
        @commitments = @commitments
      end

      @status = filters[:status]
      case @status
      when "Facture en attente"
        @commitments = @commitments.where(status: "Facture en attente")
      when "Paiement en attente"
        @commitments = @commitments.where(status: "Paiement en attente")
      when "Payé"
        @commitments = @commitments.where(status: "Payé")
      end
    end
    @commitments = @commitments.order(created_at: :desc)
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
    @organization = current_user.organization
    @commitments = Commitment.count
    @commitment.order_ref = "PO-2018-#{@commitments + 1}"
    @commitment_with_invoices = Commitment.select{|commitment| commitment.invoice?}.count
    @commitment.invoice_ref = "AC-#{@commitment_with_invoices + 1}" if @commitment.invoice?
    @commitment.status = "Paiement en attente" if @commitment.invoice? && @commitment.status == "Facture en attente"
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
    @commitment.invoice_ref = "AC-#{@commitment_with_invoices + 1}" if @commitment.invoice_ref == "" || @commitment.invoice_ref.nil?
    @commitment.update(commitment_params)
    @commitment.status = "Paiement en attente" if @commitment.invoice? && @commitment.status == "Facture en attente"
    @commitment.save
    authorize @commitment
    redirect_to commitment_path(@commitment)
  end

  def mark_as_paid
    @commitment = Commitment.find(params[:commitment_id])
    @commitment.update(status: 'Payé')
    redirect_to commitment_path(@commitment)
  end

  # def download_file
  #   @commitment = Commitment.find(params[:id])
  #   send_file(
  #     # "#{Rails.root}/public/uploads/commitment/invoice/#{@commitment.id}/#{@commitment.invoice}",
  #     "#{Rails.root}/public/#{@commitment.invoice}",
  #     filename: "#{@commitment.invoice.file.identifier}",
  #     type: "application/jpg"
  #   )
  # end

  def zip
    @commitments = Commitment.all
    @cloud_ids = []
    @commitments.each do |commitment|
      @cloud_ids << commitment.invoice.file.public_id if commitment.invoice.present?
    end
    @url = Cloudinary::Utils.download_zip_url(public_ids: @cloud_ids, target_public_id: 'factures', type: 'private')
  end

  def zip_closing
    @commitments = @processed
    @cloud_ids = []
    @commitments.each do |commitment|
      @cloud_ids << commitment.invoice.file.public_id if commitment.invoice.present?
    end
    @url = Cloudinary::Utils.download_zip_url(public_ids: @cloud_ids, target_public_id: 'factures', type: 'private')
  end

  def destroy
    @commitment = Commitment.find(params[:id])
    @commitment.destroy
    redirect_to commitments_path
  end

  def pre_closing
    if Closing.occurred
      @pre_closing_month = Time.now.strftime("%b %Y")
      offset = 1
    else
      @pre_closing_month = (Time.now - 1.month).strftime("%B %Y")
      offset = 0
    end
    @to_be_processed = Commitment.previous_month(offset).where(status: "Facture en attente").or(Commitment.previous_month(offset).where(status: "Paiement en attente", recurrence: "Ponctuel"))
    @processed = Commitment.previous_month(offset).where(status: "Paiement en attente", recurrence: "Mensuel").or(Commitment.previous_month(offset).where(status: "Payé")).or(Commitment.current_month(offset).where(postponed?: true, recurrence: "Ponctuel")).or(Commitment.current_month(offset).where(status: "Facture en attente", recurrence: "Mensuel", postponed?: true))
    @processed.each do |monthly_commitment|
      if monthly_commitment.status == "Paiement en attente" && monthly_commitment.recurrence == "Mensuel"
        monthly_commitment.update(status: "Payé")
        monthly_commitment.save!
      end
    end
  end

  def commitment_payment_proceed
    @commitment = Commitment.find(params[:commitment_id])
    @commitment.update(status: 'Payé')
    redirect_to pre_closing_path
  end

  def commitment_index
    @commitment = Commitment.find(params[:commitment_id])
    @commitment.update(status: 'Payé')
    redirect_to commitments_path
  end

  def commitment_postpone
    @commitment = Commitment.find(params[:commitment_id])
    @commitment.update(postponed?: true, due_date: @commitment.due_date >> 1)
    redirect_to pre_closing_path
  end

  def closing
    @processed = Commitment.previous_month.where(recurrence: "Mensuel").or(Commitment.previous_month.where(status: "Payé", recurrence: "Mensuel")).or(Commitment.previous_month.where(status: "Payé", recurrence: "Ponctuel"))
    @postponed = Commitment.current_month.where(postponed?: true)
    @processed.each do |monthly_commitment|
      if monthly_commitment.recurrence == "Mensuel"
        new_commitment = monthly_commitment.dup
        new_commitment.due_date = monthly_commitment.due_date >> 1
        new_commitment.invoice = nil
        new_commitment.status = "Facture en attente"
        new_commitment.save!
      elsif monthly_commitment.recurrence == "Ponctuel" && monthly_commitment.postponed? == true
        new_commitment = monthly_commitment.dup
        new_commitment.due_date = monthly_commitment.due_date >> 1
        new_commitment.save!
      end
    end
    zip_closing
    # @processed_one_off = Commitment.previous_month.where(status: "Pending invoice", recurrence: "One off")
    # @processed_one_off.each do |one_off_commit_without_invoice_but_processed|
    #   new_commitment = one_off_commit_without_invoice_but_processed.dup
    #   new_commitment.due_date = one_off_commit_without_invoice_but_processed.due_date >> 1
    #   new_commitment.save!
    # end
  end

  private

  def commitment_params
    params.require(:commitment).permit(:title, :amount, :description, :due_date, :payment_date, :status, :recurrence, :supplier_id, :retrieval_mode, :payment_method, :invoice)
  end
end
