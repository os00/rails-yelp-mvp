class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :category
      t.string :phone_number
      t.float :average_rating, default: -1.0
      t.timestamps
    end
  end
end
