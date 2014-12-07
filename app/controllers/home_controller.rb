class HomeController < ApplicationController

  def index
    @restaurants = Restaurant.all.limit(20)
    @categories = Category.all
  end

  def owner_dashboard
    query = current_user.restaurants.includes(:reservations)
    query.where("restaurants.reservations.date_time >= ?", Date.today )
    @restaurants = query.all
  end

end