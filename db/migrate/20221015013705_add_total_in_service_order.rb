class AddTotalInServiceOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :service_orders, :total_price, :decimal, default: 0
    add_column :service_orders, :total_deadline, :decimal, default: 0
  end
end
