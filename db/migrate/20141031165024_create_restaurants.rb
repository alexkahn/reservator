class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :phone
      t.string :web

      t.timestamps
    end
  end
end
