class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :category
      t.string :name
      t.string :description
      t.integer :price
      t.string :picture_url
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
