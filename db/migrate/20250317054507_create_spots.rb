class CreateSpots < ActiveRecord::Migration[7.2]
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :town, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps
    end
  end
end
