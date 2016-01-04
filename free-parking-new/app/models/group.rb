class Group < ActiveRecord::Base
  has_many :groupings
  has_many :members, through: :groupings, source: :users
  has_many :games, through: :members
end
