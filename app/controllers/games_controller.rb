class GamesController < ApplicationController

  def index
  end

  def show
    @game = Game.find_by(id: params[:id])
    @reviews = @game.reviews
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
