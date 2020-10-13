class CreateMealReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_reviews do |t|
      t.string :content
      t.string :picture_url
      t.integer :rating
      t.references :meal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
