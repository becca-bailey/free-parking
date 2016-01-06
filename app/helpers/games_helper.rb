module GamesHelper

  def friends_have_game(game)
    friends_with_game = []
    current_user.groups.each do |group|
      group.members.each do |user|
        if has_game?(user, game) && !friends_with_game.include?(user)
          friends_with_game << user
        end
      end
    end
    friends_with_game
  end

  def has_game?(user, game)
    user.games.include?(game)
  end

end
