class AddOwnerToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :owner_id, :integer
  	add_index :restaurants, :owner_id
  end
end
