class AddDeliveredInServiceOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :service_orders, :delivered_date, :datetime
    add_column :service_orders, :reason, :string
  end
end
