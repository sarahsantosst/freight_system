class TransportType < ApplicationRecord
    validates :name, :maximum_distance, :minimum_distance, :maximum_weight, :minimum_weight, :flat_hate, presence: true
end
