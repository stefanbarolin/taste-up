class Restaurant < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :name, :adress, :category

    searchableAttributes ['name', 'adress', 'category']
  end

  belongs_to :user
  has_many :meals, dependent: :destroy
  has_many :orders

  has_one_attached :photo
end
