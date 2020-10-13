class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  def create
    @restaurant = Restaurant.new(params_restaurant)
    @restaurant.save
    # redirect_to tas_patch (@definir)
  end
  def new
    @restaurant = Restaurant.new
  end
  def delete

  end

  private
  def params_restaurant
    params.require(:restaurant).permit(:category, :address, :picture_url, :id_user)
  end
end
