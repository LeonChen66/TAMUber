class AddUserToUploads < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :driver_id
    add_reference :events, :driver, index: true
  end
end
