class RestaurantController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_restaurant, except: [:index, :create, :new]
  before_action :authorized?, except: [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner = Owner.find_by_user_id(current_user.id)
    @restaurant.save()
    redirect_to @restaurant, notice: 'Created'
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
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
