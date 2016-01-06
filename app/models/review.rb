class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: "User", foreign_key: :reviewer_id
  belongs_to :game


  validates :fun_rating, presence: true
  validates :difficulty_rating, presence: true

  validates_numericality_of :fun_rating, :only_integer => true, :message => "Fun rating must be a whole number."
  validates_numericality_of :difficulty_rating, :only_integer => true, :message => "Difficulty rating must be a whole number."

end
