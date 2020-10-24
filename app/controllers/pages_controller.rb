class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :results]

  def home
  end

  def results
    if params[:query].present?
      @restaurants = Restaurant.algolia_search(params[:query])
      @meals = Meal.algolia_search(params[:query])
    else
      @restaurants = Restaurant.all
      @meals = Meal.all
    end
  end
end
