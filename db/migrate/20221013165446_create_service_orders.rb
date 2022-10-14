class CreateServiceOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_orders do |t|
      t.string :code
      t.integer :status, default: 0
      t.integer :total_distance
      t.references :vehicle, foreign_key: true
      t.string :product_code
      t.integer :product_weight
      t.integer :product_width
      t.integer :product_height
      t.integer :product_depth
      t.string :sender_address_zip_code
      t.string :sender_address_full_address
      t.string :sender_address_city
      t.string :sender_address_state
      t.string :destination_name
      t.string :destination_document
      t.string :destination_address_zip_code
      t.string :destination_address_full_address
      t.string :destination_address_city
      t.string :destination_address_state

      t.timestamps
    end
  end
end
