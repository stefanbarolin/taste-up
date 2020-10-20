class Restaurant < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :name, :adress, :picture_url, :category

    searchableAttributes ['category', 'name', 'unordered(picture_url)']
  end

  belongs_to :user
  has_many :meals, dependent: :destroy
end
