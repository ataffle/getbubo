class CommitmentsController < ApplicationController
  def new
    @commitment = Commitment.new
    @suppliers = Supplier.all
  end

  def create
    @commitment = Commitment.new(player_params)
    @commitment.user = current_user
    if @commitment.save
      redirect_to commitment_path(@commitment)
    else
      render :new
    end
  end

  private

  def player_params
    params.require(:commitment).permit(:title, :amount, :description, :due_date, :payment_date, :status, :recurrence, :supplier_id, :retrieval_mode, :payment_method)
  end
end
