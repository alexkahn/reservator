require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  
  test 'cannot create a restaurant without any parameters' do
    restaurant = Restaurant.new
    assert !restaurant.valid?
  end

  test 'cannot create a restaurant without a valid owner' do
    r = Restaurant.new
    r.name = "Test Restaurant"
    # r.owner = owners(:tom)
    assert !r.valid?, "Created a restaurant without an owner"
  end
end