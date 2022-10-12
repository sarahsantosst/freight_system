require 'rails_helper'

RSpec.describe WeightConfig, type: :model do
  describe '#valid?' do 
    it 'minimum range is mandatory' do 
      #arrange
      type = TransportType.create(name:'Test', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
      w = WeightConfig.new(maximum_range: 30, value: 20, transport_type_id: type)

      #act
      result = w.valid?

      #assert
      expect(result).to eq false
    end

    it 'maximum range distance is mandatory' do 
      #arrange
      type = TransportType.create(name:'Test', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
      w = WeightConfig.new(minimum_range:10, value: 20, transport_type: type)

      #act
      result = w.valid?

      #assert
      expect(result).to eq false
    end

    it 'value is mandatory' do 
      #arrange
      type = TransportType.create(name:'Test', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
      w = WeightConfig.new(minimum_range: 10, maximum_range: 30, transport_type: type)

      #act
      result = w.valid?

      #assert
      expect(result).to eq false
    end

    it 'create ok' do 
      #arrange
      type = TransportType.create(name: 'Test', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
      w = WeightConfig.new(minimum_range: 10, maximum_range: 30, value: 20, transport_type: type)

      #act
      result = w.valid?

      #assert
      expect(result).to eq true
    end
 end
end


