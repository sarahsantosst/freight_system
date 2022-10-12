class Address < ApplicationRecord
  validates :zip_code, :full_address, :city, :state, presence: true
end
