class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_restaurant, except: [:index, :create, :new, :dashboard]
  before_action :authorized?, except: [:index, :show]

  def index 
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new restaurant_params
    
    @restaurant.owner = current_user.owner? ? current_user : nil
    @restaurant.save

    if @restaurant.valid?
      redirect_to @restaurant, notice: 'Successfully Created'
    else
      render :new, notice: 'Something went wrong, try again'
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    if current_user.patron? and Star.where(fan: current_user, restaurant: @restaurant).exists?
      @star = Star.where(fan: current_user, restaurant: @restaurant).first
    end
  end

  def edit
  end

  def update
    @restaurant.update!(restaurant_params)
    redirect_to @restaurant, notice: "Updated"
  end

  def destroy
    @restaurant.destroy
    redirect_to action: "index"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name,:description,:address,\
                                       :city,:state,:postal_code,\
                                       :phone,:web)
  end

  def get_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def authorized?
    current_user.role == 'owner'
  end

end
