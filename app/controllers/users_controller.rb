class UsersController < ApplicationController
  before_action :load_user, only: :show
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.order_by_name(true).paginate page: params[:page],
      per_page: Settings.paginate.user_per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      login @user
      flash[:success] = t "signup.success"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "error.user_not_found"
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit :user_name, :email, :password,
      :password_confirmation, :image
  end

end
