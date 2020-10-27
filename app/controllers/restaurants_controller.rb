class RestaurantsController < ApplicationController
  before_action :init_restaurant, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    if params[:query].present?
      @restaurants = Restaurant.algolia_search(params[:query])
      @meals = Meal.algolia_search(params[:query])
    else
      @restaurants = Restaurant.all
      @meals = Meal.all
    end
    @carousel_restaurants = @restaurants.first(3)
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save!
     redirect_to restaurant_path(current_user.restaurant)
    else
      new
    end
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
    redirect_to root_path
  end

  def init_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :adress, :category, :photo)
  end
end
