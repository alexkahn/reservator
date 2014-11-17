class RestaurantController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  
  def index
    @restaurants = Restaurant.all
  end
  
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner = Owner.find(session[:user_id])
    @restaurant.save()
    redirect_to @restaurant, notice: 'Created'
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update!(restaurant_params)
    redirect_to @restaurant, notice: "Updated"
  end

  def destroy
    @restaurant = Restaurant.find(params[:id]).destroy
    @restaurant.destroy
    redirect_to action: "index"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name,:description,:address,\
                                       :city,:state,:postal_code,\
                                       :phone,:web)
  end

end