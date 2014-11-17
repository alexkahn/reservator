class AddRestaurantsToOwner < ActiveRecord::Migration
  def change
  	add_column :owners, :restaurant_id, :integer
  	add_index :owners, :restaurant_id
  end
end
