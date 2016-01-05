class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    @token = session[:token]
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @token != nil
        invite = Invite.find_by(token: @token)
        group = invite.grouping.group
        redirect_to group_invite_path(group, invite)
      else
        redirect_to user_path(@user)
      end
    else
      flash[:alert] = "Invalid username or password."
      render "sessions/new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
