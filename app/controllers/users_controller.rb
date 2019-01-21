class UsersController < ApplicationController

  def index
    @users = current_user.organization.users
  end

  def new
    @user = User.new
    @organization = current_user.organization
  end

end
