class CommitmentsController < ApplicationController

  def index
    @commitments = Commitment.all
  end

  def show
    @commitment = Commitment.find(params[:id])
  end
  
  def new
    @commitment = Commitment.new
    authorize @commitment
  end

  def create
    @commitment = Commitment.new(player_params)
    @commitment.user = current_user
    if @commitment.save
      redirect_to commitment_path(@commitment)
    else
      render :new
    end
    authorize @commitment
  end

  private

  def player_params
    params.require(:commitment).permit(:title, :amount, :description, :due_date, :payment_date, :status, :recurrence, :supplier_id, :retrieval_mode, :payment_method)
  end
end
