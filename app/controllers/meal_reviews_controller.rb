class MealReviewsController < ApplicationController

  def new
    @meal = Meal.find(params[:meal_id])
    @review = MealReview.new
  end

  def create
    @review = MealReview.new(reviews_params)
    @review.meal = Meal.find(params[:meal_id])
      if @review.save
        redirect_to meal_path(@review.meal)
      else
        render :new
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:rating, :content)
  end
end
