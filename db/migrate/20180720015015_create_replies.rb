class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :comment
      t.integer :cbook_id
      t.integer :user_id
      t.boolean :reply2, default: false

      t.timestamps null: false
    end
  end
end
