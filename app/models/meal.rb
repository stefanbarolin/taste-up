class Meal < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :name, :description

    searchableAttributes ['name', 'description']
  end
  has_many :meal_reviews, dependent: :destroy
  belongs_to :restaurant

  has_one_attached :photo
end
