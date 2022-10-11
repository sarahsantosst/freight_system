class Vehicle < ApplicationRecord
  belongs_to :transport_type
  validates :license_plate, :brand, :model, :manufacture_year, :maximum_load_capacity, :transport_type_id,  presence: true
end
