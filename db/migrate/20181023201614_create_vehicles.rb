class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.boolean :isAvailable, :default => true

      t.timestamps
    end
  end
end
