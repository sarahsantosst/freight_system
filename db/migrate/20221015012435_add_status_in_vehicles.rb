class AddStatusInVehicles < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :status, :integer, default: 0
    remove_column :vehicles, :active
  end
end
