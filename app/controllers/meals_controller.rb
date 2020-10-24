class MealsController < ApplicationController
  before_action :init_meal, only: [:show, :edit, :update, :destroy]
  before_action :current_restaurant, only: [:index, :new, :create]

  def home
  end

  def index
    @meals = Meal.all
  end

  def show
    # @order = @meal.order
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.restaurant = @restaurant
    if @meal.save
    redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @meal.assign_attributes(meal_params)
    @meal.save
    redirect_to restaurant_meal_path(@meal)
  end
  def destroy
    @meal.destroy
    redirect_to restaurant_path(@meal.restaurant)
  end

  def init_meal
    @meal = Meal.find(params[:id])
  end
  def current_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  private

  def meal_params
    params.require(:meal).permit(:picture_url, :price, :description, :name)
  end
end
