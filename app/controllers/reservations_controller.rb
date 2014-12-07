class ReservationsController < ApplicationController
  
  def index
    if current_user.role == "patron"
      @reservations = Reservation.where(patron: current_user.id)
    elsif current_user.role == "owner"
      @reservations = Reservation.where(restaurant: current_user.restaurants)
    else
      redirect_to :root
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def create
    # @restaurant = Restaurant.find_by_id(params[:restaurant_id])
    @reservation = Reservation.new(reservation_params.merge(restaurant_id: params[:restaurant_id]))
    @reservation.patron = current_user unless current_user == nil
    @reservation.save 
    redirect_to @reservation.restaurant, notice: "Reservation request sent for #{@reservation.restaurant.name}"
  end
  
  def edit
    @reservation = Reservation.find(params[:id])
  end
  
  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update!(reservation_params)
    redirect_to @reservation, notice: "Updated reservation"
  end
  
  def destroy
    @reservation = Reservation.find(params[:id]).destroy
    @reservation.destroy
    redirect_to action: "index"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :email, :date_time, :restaurant_id)
  end

end