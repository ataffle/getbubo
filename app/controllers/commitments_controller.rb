class CommitmentsController < ApplicationController
  def index
    # @commitments = policy_scope(Commitment)
    @commitments = Commitment.all
    filters = params[:filters]
    if filters
      @period = filters[:period]
      @status = filters[:status]
      if @period == "Previous month"
        @commitments = @commitments.previous_month
      elsif @period == "Next month"
        @commitments = @commitments.next_month
      elsif @period == "Current month"
        @commitments = @commitments.current_month
      elsif @period == "Year-to-date"
        @commitments = @commitments.year_to_date
      elsif @period == "All time"
        @commitments = @commitments
      elsif @status == "Pending invoice"
        @commitments = @commitments.where(status: "Pending invoice")
      elsif @status == "Pending payment"
        @commitments = @commitments.where(status: "Pending payment")
      elsif @status == "Paid"
        @commitments = @commitments.where(status: "Paid")
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
    @commitment.status = "Pending payment" if @commitment.invoice? && @commitment.status == "Pending invoice"
    @organization = current_user.organization
    @commitments = Commitment.count
    @commitment.order_ref = "PO - 2018 - #{@commitments + 1}"
    @commitment_with_invoices = Commitment.select{|commitment| commitment.invoice?}.count
    @commitment.invoice_ref = "AC - #{@commitment_with_invoices + 1}"
    if @commitment.save
      redirect_to commitment_path(@commitment)
    else
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
    @commitment.invoice_ref? ? @commitment.invoice_ref : @commitment.invoice_ref = "AC - #{@commitment_with_invoices + 1}"
    @commitment.update(commitment_params)
    @commitment.status = "Pending payment" if @commitment.invoice? && @commitment.status == "Pending invoice"
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

  private

  def commitment_params
    params.require(:commitment).permit(:title, :amount, :description, :due_date, :payment_date, :status, :recurrence, :supplier_id, :retrieval_mode, :payment_method, :invoice)
  end
end
