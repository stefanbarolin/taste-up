class OrdersController < ApplicationController

  def index
    @order = Order.all
  end
  def edit
    @order= Order.find(params[:id])
    @order.assign_attributes(order_params)
    @order.save
    redirect_to task_path
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save
    redirect_to restaurant_meal_order_path(@order)
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @meal = Meal.find(params[:meal_id])
    @order = Order.new
  end

  def update

  end

  def destroy
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:id_meals, :id_users, :id_restaurants)
  end
end
