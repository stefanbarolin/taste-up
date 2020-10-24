class Restaurant < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :name, :adress, :category

    searchableAttributes ['category', 'name', 'adress']
  end

  belongs_to :user
  has_many :meals, dependent: :destroy

  has_one_attached :photo
end
