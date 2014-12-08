class StarsController < ApplicationController
  
  def index
    @restaurants = Star.where(fan: current_user.id)
  end
  
  def create
    @star = Star.new
    @star.restaurant_id = params[:id]
    @star.fan = current_user
    @star.save
  end

  def destroy
    @star = Star.find(params[:id])
    @restaurant = @star.restaurant
    @star.destroy
  end

  private

end
