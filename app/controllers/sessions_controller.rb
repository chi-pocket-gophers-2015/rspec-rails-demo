class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
               .try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = "Invalid email/password combination."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to categories_path
  end
end
