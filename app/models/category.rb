class Category < ActiveRecord::Base
	has_many :restaurants, through: :restaurants_categories
end
