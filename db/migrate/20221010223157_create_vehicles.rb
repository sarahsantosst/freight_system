class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.references :transport_type, null: false, foreign_key: true
      t.string :license_plate
      t.string :brand
      t.string :model
      t.string :manufacture_year
      t.string :maximum_load_capacity

      t.timestamps
    end
  end
end
