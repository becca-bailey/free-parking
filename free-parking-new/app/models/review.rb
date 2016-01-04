class Review < ActiveRecord::Base
  belongs_to :reviewer
  belongs_to :game
end
