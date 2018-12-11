class ClosingsController < ApplicationController
  def create
    Closing.create
    redirect_to closing_path
  end
end
