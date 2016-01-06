class User < ActiveRecord::Base
  has_many :owned_games
  has_many :games, through: :owned_games
  has_many :groupings, dependent: :destroy
  has_many :groups, through: :groupings
  has_many :reviews, foreign_key: :reviewer_id
  has_many :invitations, class_name: "Invite", foreign_key: :recipient_id
  has_many :sent_invitations, class_name: "Invite", foreign_key: :sender_id
  has_many :created_games, class_name: "Game", foreign_key: :creator_id

  validates :email, :format => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates_confirmation_of :password, :message => "Passwords must match."
  validates_length_of :name, :maximum => 20, :message => "Name must be less than 20 characters."

  has_secure_password

end
