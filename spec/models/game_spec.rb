require 'rails_helper'

describe Game do
  let(:game) {Game.new}
  it "creates a invalid game"  do
    game = Game.new()
    expect(game.valid?).to be false
  end

  it "creates a valid game" do
    game = Game.new(name: "Dnd", min_players: 2)
    expect(game.valid?).to be true
  end

  it "has a working fun average method" do
    game = Game.new(name: "Dnd", min_players: 5)
    game.save
    game.reviews.create(fun_rating: 5, difficulty_rating: 5)
    expect(game.fun_average).to be 5.0
    expect(game.difficulty_average).to be 5.0
  end

  it "has a average method that gives an average" do
    game = Game.new(name: "Pop and Floop", min_players: 5)
    game.save
    game.reviews.create(fun_rating: 5, difficulty_rating: 5)
    game.reviews.create(fun_rating: 2, difficulty_rating: 2)
    expect(game.fun_average).to be 3.5
    expect(game.difficulty_average).to be 3.5
  end

  it "should have many reviews" do
    t = Game.reflect_on_association(:reviews)
    t.macro.should == :has_many
  end

  it "should have many owned_games" do
    t = Game.reflect_on_association(:owned_games)
    t.macro.should == :has_many
  end

end