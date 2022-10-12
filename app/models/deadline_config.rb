class DeadlineConfig < ApplicationRecord
  belongs_to :transport_type
  validates :minimum_range, :maximum_range, :value, :transport_type_id,  presence: true
end
