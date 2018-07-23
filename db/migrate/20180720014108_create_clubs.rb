class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :title
      t.string :desc
      t.string :image
      t.string :time
      t.string :location
      t.string :pay
      t.string :captain_email

      t.timestamps null: false
    end
  end
end
