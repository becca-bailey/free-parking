class Group < ActiveRecord::Base
  has_many :groupings
  has_many :members, through: :groupings, source: :user
  has_many :games, through: :members, source: :games

  # def member_has_game(game)
  #   members.find_by()
  # end

end
