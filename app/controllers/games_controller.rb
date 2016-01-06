class GamesController < ApplicationController

  def index
    if params[:alphabet_sort]
      @games = Game.all.select { |a| a.name[0].upcase == params[:alphabet_sort] }
    else
      @games = Game.all.sort_by { |a| a.name }
    end


    case params[:sort_by]
    when "name_asc"
      @games = @games.sort_by { |a| a.name }
    when "name_desc"
      @games = @games.sort_by { |a| a.name }.reverse
    when "fun_asc"
      @games = @games.sort_by { |a| a.fun_average }
    when "fun_desc"
      @games = @games.sort_by { |a| a.fun_average }.reverse
    when "dif_asc"
      @games = @games.sort_by { |a| a.difficulty_average }
    when "dif_desc"
      @games = @games.sort_by { |a| a.difficulty_average }.reverse
    when "players_asc"
      @games = @games.sort_by { |a| a.min_players }
    when "players_desc"
      @games = @games.sort_by { |a| a.min_players }.reverse
    else
      @games
    end

    @alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  end

  def show
    @game = Game.find_by(id: params[:id])
    @reviews = @game.reviews
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.created_games.build(game_params)
    if @game.save
      redirect_to root_path
    else
      render "new"
    end
  end



  def edit
      @game = Game.find_by(id: params[:id])
  end

  def update
      @game = Game.find_by(id: params[:id])
      @game.update(game_params)

      redirect_to game_path(@game)
  end

  def destroy
      @game = Game.find_by(id: params[:id])
      @game.destroy

      redirect_to root_path
  end

  private

  def game_params
    params.require(:game).permit(:name, :image_url, :description, :info_link, :min_players, :max_players)
  end

end
