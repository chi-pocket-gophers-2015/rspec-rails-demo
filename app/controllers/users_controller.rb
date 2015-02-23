class UsersController < ApplicationController
  before_action :authenticate, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      @errors = @user.errors
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
