class RemoveCategoryFromMeals < ActiveRecord::Migration[6.0]
  def change
    remove_column :meals, :category, :string
  end
end
