class CommitmentsController < ApplicationController
  def index
    @commitments = Commitment.all
  end

  def show
    @commitment = Commitment.find(params[:id])
  end
end
