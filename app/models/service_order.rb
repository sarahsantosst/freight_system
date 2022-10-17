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
   
  enum status: { pending: 0, started: 3, delivered: 5, canceled: 9, closed_on_deadline: 11, closed_late: 13 }

  def calc_total_price(transport_type)
    weight_config = WeightConfig.all.filter { |wc|
      wc.transport_type_id == transport_type.id && wc.minimum_range <= self.product_weight && wc.maximum_range >= self.product_weight 
    }.first

    distance_config = DistanceConfig.all.filter { |dc|
      dc.transport_type_id == transport_type.id && dc.minimum_range <= self.total_distance && dc.maximum_range >= self.total_distance 
    }.first

    if weight_config.present? && distance_config.present?
      weight_config.value + distance_config.value + transport_type.flat_hate
    else
      'Não foi possível calcular'
    end
  end

  def calc_total_deadline(transport_type)
    deadline_config = DeadlineConfig.all.filter { |dc|
      dc.transport_type_id == transport_type.id && dc.minimum_range <= self.total_distance && dc.maximum_range >= self.total_distance 
    }.first

    if deadline_config.present?
      deadline_config.value
    else
      'Não foi possível calcular'
    end
  end

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
    self.product_code = SecureRandom.alphanumeric(8).upcase
  end
end


