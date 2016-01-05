class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:new, :create]
  def new
    @user = User.new
    @token = params[:invite_token]
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @token = params[:invite_token]
    if @user.save
      if @token != nil
        group = Invite.find_by_token(@token).user_group
        @user.groupings.push(group)
      end
      session[:user_id] = @user.id
      flash[:message] = "You have successfully created an account."
      redirect_to user_path(@user)
    else
      render "users#new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :invite_token)
  end
end
