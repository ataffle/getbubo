class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  after_action :verify_authorized, except: :home

  def home
    @commitments = Commitment.all
  end
end
