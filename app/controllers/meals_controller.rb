class MealsController < ApplicationController
  class RestaurantsController < ApplicationController
  before_action :init_meal, only: [:show, :edit, :update, :destroy]
  before_action :current_restaurant, only: [:index, :nex, :create]

  def home
  end

  def index
    @meals = Meal.all
  end

  def show
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.restaurant = @restaurant
    @meal.save
    redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  def update
    @meal.assign_attributes(meal_params)
    @meal.save
    redirect_to meal_path(@meal)
  end
  def destroy
    @meal.destroy
    redirect_to restaurants_path
  end

  def init_meal
    @meal = Meal.find(params[:id])
  end
  def current_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  private

  def restaurant_params
    params.require(:meal).permit(:restaurant_id, :picture_url, :price, :description, :name, :category)
  end
end
end
