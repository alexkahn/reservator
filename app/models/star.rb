class Star < ActiveRecord::Base
	belongs_to :fan, class_name: User
  belongs_to :restaurant
end
