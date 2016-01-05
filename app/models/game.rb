class Game < ActiveRecord::Base
  has_many :reviews
  has_many :owned_games
  has_many :owners, through: :owned_games, source: :user

  def fun_average
    total = 0
    reviews.each do |review|
      total += review.fun_rating
    end
    (total / reviews.length).round(2)
  end

  def difficulty_average
    total = 0
    reviews.each do |review|
      total += review.difficulty_rating
    end
    (total / reviews.length).round(2)
  end

end
