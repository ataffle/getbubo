class ApplicationController < ActionController::Base
  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
