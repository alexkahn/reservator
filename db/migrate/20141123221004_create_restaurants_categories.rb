class CreateRestaurantsCategories < ActiveRecord::Migration
  def change
  	create_table :restaurants_categories, id: false do |t|
  		t.belongs_to :restaurant
  		t.belongs_to :category
  	end
  end
end
