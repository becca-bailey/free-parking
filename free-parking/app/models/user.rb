class User < ActiveRecord::Base
  has_many :owned_games
  has_many :games, through: :owned_games
  has_many :groupings
  has_many :groups, through: :groupings
  has_many :reviews, :foreign_key => 'reviewer_id'
end
