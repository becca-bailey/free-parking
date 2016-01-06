class Group < ActiveRecord::Base

  has_many :groupings, dependent: :destroy
  has_many :members, through: :groupings, source: :user
  has_many :games, through: :members, source: :games


  validates_length_of :name, :maximum => 30, :message => "Group names must be less than 30 characters long."
  # def member_has_game(game)
  #   members.find_by()
  # end

end
