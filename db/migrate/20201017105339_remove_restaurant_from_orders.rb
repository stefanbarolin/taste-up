class RemoveRestaurantFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :restaurant, null: false, foreign_key: true
  end
end
