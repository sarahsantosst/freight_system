class ServiceOrder < ApplicationRecord
  belongs_to :vehicle, required: false
  before_validation :generate_code, on: :create

  validates :code, :status, :total_distance, :product_code,
   :product_weight, :product_width, :product_height, 
   :product_depth, :sender_address_zip_code, 
   :sender_address_full_address, :sender_address_city,
   :sender_address_state, :destination_name, :destination_document, 
   :destination_address_zip_code, :destination_address_full_address, :destination_address_city, 
   :destination_address_state, presence: true
   
  enum status: { pending: 0, delivered: 5, canceled: 9 }

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
    self.product_code = SecureRandom.alphanumeric(8).upcase
  end
end


