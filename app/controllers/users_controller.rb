class UsersController < ApplicationController

  def index
    @users = current_user.organization.users
  end

  def new
    @user = User.new
    @organization = current_user.organization
  end

  def create
    @user = User.new(user_params)
    @user.organization = current_user.organization
    @user.password = '123456'
    @user.photo = 'profile-placeholder.png'
    if @user.save
      redirect_to users_path
    else
      redirect_to new_organization_user_path(current_user.organization)
    end
  end

  private

  def set_users
    @users = current_user.organization.users
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
