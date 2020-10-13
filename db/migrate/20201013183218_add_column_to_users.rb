class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :username, :string
    add_column :users, :address, :string
    add_column :users, :age, :integer
  end
end
