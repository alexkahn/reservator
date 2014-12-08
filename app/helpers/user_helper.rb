module UserHelper
  def owns_this_restaurant user_id, restuarant_owner_id
    user_id == restuarant_owner_id
  end

  def starred_this_restaurant user, restuarant
    Star.where(fan: user, restaurant: restuarant).exists?
  end
end