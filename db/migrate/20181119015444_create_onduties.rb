class CreateOnduties < ActiveRecord::Migration[5.2]
  def change
    create_table :onduties do |t|
      t.string :driverName
      t.string :plateNumber
      
      t.string :studentName
      t.string :studentId

      t.float :vehicleLat
      t.float :vehicleLng

      t.float :startLat
      t.float :startLng

      t.float :endLat
      t.float :endLng

      t.boolean :isFinished
      t.boolean :isAlert
      t.timestamps
    end
  end
end
