class CommitmentsController < ApplicationController
  def index
    @commitments = policy_scope(Commitment)
    authorize @commitments
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
    @commitment.update(commitment_params)
    @organization = current_user.organization
    @commitment_with_invoices = Commitment.select{|commitment| commitment.invoice?}.count
    @commitment.invoice_ref = "AC - #{@commitment_with_invoices + 1}"
    @commitment.status = "Pending payment" if @commitment.invoice? && @commitment.status == "Pending invoice"
    @commitment.save
    authorize @commitment
    redirect_to commitment_path(@commitment)
  end


  private

  def commitment_params
    params.require(:commitment).permit(:title, :amount, :description, :due_date, :payment_date, :status, :recurrence, :supplier_id, :retrieval_mode, :payment_method, :invoice)
  end
end
