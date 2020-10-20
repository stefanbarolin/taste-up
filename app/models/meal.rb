class Meal < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :name, :description, :picture_url

    searchableAttributes ['name', 'description', 'unordered(picture_url)']
  end
  has_many :reviews, dependent: :destroy
  belongs_to :restaurant
end
