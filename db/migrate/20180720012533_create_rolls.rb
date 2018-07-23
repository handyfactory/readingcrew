class CreateRolls < ActiveRecord::Migration
  def change
    create_table :rolls do |t|
      t.string :relation
      t.references :user, index: true, foreign_key: true
      t.references :club, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
