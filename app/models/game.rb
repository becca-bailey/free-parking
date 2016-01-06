class Game < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :owned_games
  has_many :owners, through: :owned_games, source: :user
  belongs_to :creator, class_name: "User"

  validates_numericality_of :min_players
  validates_numericality_of :max_players, :greater_than_or_equal_to => :min_players, :message => "Max players must be greater or equal to min min_players`ers"

  def fun_average
    if !reviews.empty?
      total = 0
      reviews.each do |review|
        total += review.fun_rating
      end
      (total / reviews.length.to_f).round(2)
    else
      return 0
    end
  end

  def difficulty_average
    if !reviews.empty?
      total = 0
        reviews.each do |review|
          total += review.difficulty_rating
        end
        (total / reviews.length.to_f).round(2)

    else
      return 0
    end
  end

end
