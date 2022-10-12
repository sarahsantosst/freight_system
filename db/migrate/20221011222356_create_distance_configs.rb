class CreateDistanceConfigs < ActiveRecord::Migration[7.0]
  def change
    create_table :distance_configs do |t|
      t.references :transport_type, null: false, foreign_key: true
      t.integer :minimum_range
      t.integer :maximum_range
      t.decimal :value

      t.timestamps
    end
  end
end
