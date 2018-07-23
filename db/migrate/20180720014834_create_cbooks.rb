class CreateCbooks < ActiveRecord::Migration
  def change
    create_table :cbooks do |t|
      t.string :title
      t.string :image
      t.string :authors
      t.string :category
      t.string :contents
      t.string :why
      t.integer :times
      t.datetime :register_at
      t.integer :user_id
      t.integer :club_id

      t.timestamps null: false
    end
  end
end
