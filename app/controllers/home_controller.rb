class HomeController < ApplicationController

  def index
    @restaurants = Restaurant.all.limit(20)
    @categories = Category.all
  end

  def owner_dashboard
    @restaurants = current_user.restaurants.includes(:reservations)
    @reservations = Reservation.where(restaurants: @restaurants)
  end

end
