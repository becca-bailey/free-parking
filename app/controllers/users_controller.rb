class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:new, :create]
  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @token = session[:token]
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "You have successfully created an account."
      if @token != nil
        invite = Invite.find_by(token: @token)
        group = invite.grouping.group
        redirect_to group_invite_path(group, invite)
      else
        redirect_to user_path(@user)
      end
    else
      render "users/new"
    end
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @user_reviews = []
    @reviews.each do |review|
      game_id = review.game_id
      game = Game.find_by(id: game_id)
      @user_reviews << game
    end
    @user_reviews
  end

  def destroy
  end


  def add_game
    @game = Game.find_by(id: params[:id])
    current_user.games << @game
    redirect_to game_path(@game)
  end

  def remove_game
    @game = Game.find_by(id: params[:id])
    current_user.games.delete(@game)

    redirect_to game_path(@game)
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :invite_token)
  end
end
