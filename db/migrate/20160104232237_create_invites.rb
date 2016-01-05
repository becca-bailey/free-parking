class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.references :grouping
      t.references :sender
      t.references :recipient
      t.string :token
      t.timestamps null: false
    end
  end
end
