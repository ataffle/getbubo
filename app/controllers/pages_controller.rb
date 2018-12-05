class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  after_action :verify_authorized, except: :home

  def home
    @commitments = Commitment.all
    @statuses = @commitments.map do |commitment|
      commitment.status
    end
    @amounts = @commitments.map do |commitment| {
      status: commitment.status,
      amount: commitment.amount
    }
    end
  end
end
