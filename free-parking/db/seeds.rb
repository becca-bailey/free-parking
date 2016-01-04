# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

25.times do
  counter = 1
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Internet.password(8), image_url: 'http://placekitten.com/150/150', bio: Faker::Hipster.paragraph)
  Review.create(reviewer_id: counter, games_id: counter, fun_rating: (rand(5) + 1), difficulty_rating: (rand(5) + 1), content: Faker::Hacker.say_something_smart)
  Game.create(name: Faker::App.name, description: Faker::Hacker.adjective, info_link: Faker::Internet.url, min_players: (rand(3)+ 1), max_players: (rand(10) + 1))
  counter += 1
end

5.times do
  Group.create(name: Faker::Hacker.noun)
end
