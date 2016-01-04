class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.references :users
      t.references :group
      t.timestamps null: false
    end
  end
end
