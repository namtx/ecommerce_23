class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  end

  def edit
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit :user_name, :email, :password,
      :password_confirmation, :image
  end
end
