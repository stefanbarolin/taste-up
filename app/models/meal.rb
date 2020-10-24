class Meal < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :name, :description

    searchableAttributes ['name', 'description']
  end

  belongs_to :restaurant

  has_one_attached :photo
end
