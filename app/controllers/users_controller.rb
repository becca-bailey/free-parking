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
        invite = Invite.find_by(token: @token)
        grouping_id = invite.grouping_id
        grouping = Grouping.find_by(id: grouping_id)
        game_group = grouping.group
        @user.groups << game_group
      end
      session[:user_id] = @user.id
      flash[:message] = "You have successfully created an account."
      redirect_to user_path(@user)
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
