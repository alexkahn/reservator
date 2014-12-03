class Category < ActiveRecord::Base
	has_many_and_belongs_to_many :restaurants
end
