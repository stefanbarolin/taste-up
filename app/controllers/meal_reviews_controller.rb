class MealReviewsController < ApplicationController
  
  def new
    @meal = Meal.find(params[:meal_id])
    @meal_review = MealReview.new
  end

  def create
    @meal_review = MealReview.new(reviews_params)
    @meal_review.meal = Meal.find(params[:meal_id])
    @meal_review.user = current_user
      if @meal_review.save
        redirect_to meal_path(@meal_review.meal)
      else
        render :new
    end
  end

  private

  def reviews_params
    params.require(:meal_review).permit(:rating, :content)
  end
end
