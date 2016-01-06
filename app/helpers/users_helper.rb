module UsersHelper

  def find_review_game(review)
    game = Game.find_by(id: review.game_id)
  end

end
