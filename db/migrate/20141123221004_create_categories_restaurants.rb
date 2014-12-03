class CreateCategoriesRestaurants < ActiveRecord::Migration
  def change
  	create_table :categories_restaurants, id: false do |t|
  		t.belongs_to :restaurant
  		t.belongs_to :category
  	end
  end
end
