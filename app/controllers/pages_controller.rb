class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def results
    @restaurants = Restaurant.all
    @meals = Meal.all
  end
end
