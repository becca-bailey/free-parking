class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :reviewer, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true
      t.text :content
      t.integer :fun_rating, null: false
      t.integer :difficulty_rating, null: false

      t.timestamps null: false
    end
  end
end
