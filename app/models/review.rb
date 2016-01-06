class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: "User", foreign_key: :reviewer_id
  belongs_to :game

  validates :fun_rating, presence: true
  validates :difficulty_rating, presence: true

end
