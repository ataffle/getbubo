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
    @commitment = Commitment.new(player_params)
    @commitment.user = current_user
    @commitments = Commitment.count
    @commitment.order_ref = "PO - 2018 - #{@commitments + 1}"
    if @commitment.save
      redirect_to commitment_path(@commitment)
    else
      render :new
    end
    authorize @commitment
  end

  def update

  end

  private

  def player_params
    params.require(:commitment).permit(:title, :amount, :description, :due_date, :payment_date, :status, :recurrence, :supplier_id, :retrieval_mode, :payment_method, :invoice)
  end
end
