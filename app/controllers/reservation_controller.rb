class ReservationController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.save()
    redirect_to @reservation, notice: 'Created'
  end
  
  def edit
    @reservation = Reservation.find(params[:id])
  end
  
  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update!(reservation_params)
    redirect_to @reservation, notice: "Updated"
  end
  
  def destroy
    @reservation = Reservation.find(params[:id]).destroy
    @reservation.destroy
    redirect_to action: "index"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :email, :date, :time)
  end

end