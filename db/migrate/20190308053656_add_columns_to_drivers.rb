class AddColumnsToDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :Email, :string
    add_column :drivers, :UIN, :string
  end
end
