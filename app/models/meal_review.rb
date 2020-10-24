class MealReview < ApplicationRecord
  belongs_to :meal
  belongs_to :user

  has_one_attached :photo
end
