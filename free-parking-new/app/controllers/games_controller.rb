class GamesController < ApplicationController

  def index
    if params[:alphabet_sort]
      @games = Game.all.select { |a| a.name[0].upcase == params[:alphabet_sort] }
    else
      @games = Game.all
    end

    if params[:sort_by] == "name_asc"
      @games = @games.sort_by { |a| a.name }
    elsif params[:sort_by] == "name_desc"
      @games = @games.sort_by { |a| a.name }.reverse
    elsif params[:sort_by] == "fun_asc"
      @games = @games.sort_by { |a| a.fun_average }
    elsif params[:sort_by] == "fun_desc"
      @games = @games.sort_by { |a| a.fun_average }.reverse
    elsif params[:sort_by] == "dif_asc"
      @games = @games.sort_by { |a| a.difficulty_average }
    elsif params[:sort_by] == "dif_desc"
      @games = @games.sort_by { |a| a.difficulty_average }.reverse
    else
      @games = @games = @games.sort_by { |a| a.name }
    end

    @alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
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
