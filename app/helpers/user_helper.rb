module UserHelper
  def owns_this_restaurant user_id, restuarant_owner_id
    user_id == restuarant_owner_id
  end
end