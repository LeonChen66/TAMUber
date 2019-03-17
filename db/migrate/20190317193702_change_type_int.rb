class ChangeTypeInt < ActiveRecord::Migration[5.2]
  def change
        remove_column :events, :driver_id
  end
end
