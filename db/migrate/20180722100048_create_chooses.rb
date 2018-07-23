class CreateChooses < ActiveRecord::Migration
  def change
    create_table :chooses do |t|
      t.string :title
      t.string :authors
      t.string :thumbnail
      t.string :category
      t.string :contents

      t.timestamps null: false
    end
  end
end
