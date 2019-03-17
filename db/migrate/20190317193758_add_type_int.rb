class AddTypeInt < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :driver_id, :integer
  end
end
