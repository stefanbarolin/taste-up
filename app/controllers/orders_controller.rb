class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  # def edit
  #   @order= Order.find(params[:id])
  #   @order.assign_attributes(order_params)
  #   @order.save
  #   redirect_to task_path
  # end

  def create
    @meal = Meal.find(params[:meal_id])
    @order = Order.new(order_params)
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

  # def update
  #   edit
  # end

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
