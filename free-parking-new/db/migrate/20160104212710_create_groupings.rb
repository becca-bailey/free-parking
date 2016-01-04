class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.references :user, index: true
      t.references :group, index: true

      t.timestamps null: false
    end
  end
end
