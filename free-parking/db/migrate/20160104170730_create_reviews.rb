class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :reviewer
      t.references :games
      t.integer    :fun_rating, null: false
      t.integer    :difficulty_rating, null: false
      t.text       :content

      t.timestamps null: false
    end
  end
end
