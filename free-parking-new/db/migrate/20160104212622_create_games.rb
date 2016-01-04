class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name null: false
      t.string :image
      t.text :description
      t.string :info_link
      t.integer :min_players null: false
      t.integer :max_players

      t.timestamps null: false
    end
  end
end
