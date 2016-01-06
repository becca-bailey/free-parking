
File.readlines("game_list").each do |game|
  Game.create!(name: game.strip, min_players: (rand(1..4)+1), max_players: (rand(4..8)+1))
end

games = Game.all

games.each do |game|
  review = Review.create!(fun_rating: (rand(1..5)+1), difficulty_rating: (rand(1..5)+ 1))
  game.reviews << review
end