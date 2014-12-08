module StarHelper
  def starred_this_restaurant user_id, restaurant_id
    Star.where(fan_id: user_id, restaurant_id: restaurant_id).exists?
  end
end