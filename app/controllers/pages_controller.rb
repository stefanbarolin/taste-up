class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def results
    @restaurants = Restaurant.all.limit(4)
    @meals = Meal.all.limit(4)
  end
end
