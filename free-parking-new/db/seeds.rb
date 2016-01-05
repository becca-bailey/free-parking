counter = 1
25.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Internet.password(8), image_url: 'http://placekitten.com/150/150', bio: Faker::Hipster.paragraph)
  Review.create(reviewer_id: counter, game_id: counter, fun_rating: (rand(5) + 1), difficulty_rating: (rand(5) + 1), content: Faker::Hacker.say_something_smart)
  Game.create(name: Faker::App.name, image_url: 'http://placekitten.com/200/200', description: Faker::Hacker.adjective, info_link: Faker::Internet.url, min_players: (rand(3)+ 1), max_players: (rand(10) + 1))
  counter += 1
end

5.times do
  Group.create(name: Faker::Hacker.noun)
end


group_counter = 1
user_counter = 1
5.times do
  5.times do
    group = Group.find_by(id: group_counter)
    user = User.find_by(id: user_counter)
    group.members << user
    user_counter += 1
  end
  group_counter += 1
end

games_counter = 1
user_counter = 1
25.times do
  game = Game.find_by(id: games_counter)
  user = User.find_by(id: user_counter)
  user.games << game
  games_counter += 1
  user_counter += 1
end
