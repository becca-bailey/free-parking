class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email([:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.user_id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid username or password."
      render "session#new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
