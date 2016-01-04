class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :owned_games
  has_many :games, through: :owned_games
  has_many :groupings
  has_many :groups, through: :groupings
  has_many :reviews, as: :reviewer
end
