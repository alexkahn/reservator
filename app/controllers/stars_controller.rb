class StarsController < ApplicationController
  
  def index
    @restaurants = Star.where(fan: current_user.id)
  end
  
  def create
    star_maker = StarMaker.new(current_user.id, params[:restaurant_id])
    
    if star_maker
      status_code = 200
    else
      status_code = 400
    end
    
    responds_to do |format|
      format.json { render json: status_code }
      format.js
    end
  end

  def destroy
    @star = Star.find(params[:id])
    @star.destroy
    
    responds_to do |format|
      format.json { render json: status_code }
      format.js
    end
  end

  private

  def restaurant_params
    params.require(:star).permit(:restaurant_id, :fan_id)
  end

end
