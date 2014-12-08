class Star < ActiveRecord::Base
	belongs_to :fan, class_name: User
  belongs_to :restaurant
end

# class StarMaker
#   attr_accessor :restaurant
#   attr_accessor :fan

#   def initialize(fan, restaurant)
#     @star = Star.new
#     @fan = fan
#     @restaurant = restaurant
#   end

#   def create
#     @star.fan = @fan.patron? ? @fan.id : nil
#     @star.restaurant = @restaurant
#     @star.save
#   end
# end