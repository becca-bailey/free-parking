require "rails_helper"

feature "User visits a game page" do
  scenario "Sees a fun rating" do
    visit "/"
    expect(page).to have_content "Fun Rating"
  end

  scenario "Sees a game page" do
    game = Game.new(name: "Dnd", min_players: 5)
    visit "/games/#{game.id}"
    expect(page).to have_content "Fun Rating"
  end

  scenario "Sees a game page" do
    game = Game.new(name: "Dnd", min_players: 5)
    visit "/games/#{game.id}"
    expect(page).to have_content "Difficulty Rating"
  end
end