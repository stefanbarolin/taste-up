class Meal < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :name, :description, :picture_url

    searchableAttributes ['name', 'description', 'unordered(picture_url)']
  end
  has_many :meal_reviews, dependent: :destroy
  belongs_to :restaurant
end
