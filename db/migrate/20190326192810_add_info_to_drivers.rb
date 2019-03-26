class AddInfoToDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :license, :string
    add_column :drivers, :tel, :string
    add_column :drivers, :address, :string
  end
end
