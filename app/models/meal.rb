class Meal < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :name, :description, :picture_url

    searchableAttributes ['name', 'description', 'unordered(picture_url)']
  end

  belongs_to :restaurant
end
