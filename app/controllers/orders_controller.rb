class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @order = Order.new
    @order.user = current_user
    @order.meal = @meal

    if @order.save!
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def new
    @meal = Meal.find(params[:meal_id])
    @order = Order.new
    @random_meals = Meal.all.sample(3)
  end

  def destroy
    @order = Order.find(params[:id])
    @meal = @order.meal
    @order.destroy
    redirect_to meal_orders(@meal)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:meal_id, :user_id)
  end
end
