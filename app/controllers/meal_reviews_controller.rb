class MealReviewsController < ApplicationController

  def create
    @meal = Meal.find(params[:meal_id])
    @meal_review = MealReview.new(reviews_params)
    @meal_review.meal = @meal
    @meal_review.user = current_user
    if @meal_review.save
      redirect_to meal_path(@meal)
    else
      render 'meal/show'
    end
  end

  private

  def reviews_params
    params.require(:meal_review).permit(:rating, :content)
  end
end
