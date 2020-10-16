class RestaurantsController < ApplicationController
  before_action :init_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    raise
    redirect_to restaurants_path
  end

  def edit
  end

  def update
    @restaurant.assign_attributes(restaurant_params)
    @restaurant.save
    redirect_to restaurants_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def init_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :adress, :category, :user_id, :picture_url)
  end
end
