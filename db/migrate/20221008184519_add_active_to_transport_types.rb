class AddActiveToTransportTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :transport_types, :active, :boolean, default: true
  end
end
