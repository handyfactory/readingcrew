class CreateReply2s < ActiveRecord::Migration
  def change
    create_table :reply2s do |t|
      t.string :comment
      t.integer :reply_id
      t.integer :user_id
      t.integer :cbook_id

      t.timestamps null: false
    end
  end
end
