class CreateOwnedGames < ActiveRecord::Migration
  def change
    create_table :owned_games do |t|
      t.references :user, index: true
      t.references :game, index: true

      t.timestamps null: false
    end
  end
end
