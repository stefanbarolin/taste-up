class AddNameToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :title, :string
  end
end
