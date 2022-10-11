require 'rails_helper'

RSpec.describe TransportType, type: :model do
  describe '#valid?' do 
    it 'name is mandatory' do 
      #arrange
      type = TransportType.new(name:'', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)

      #act
      result = type.valid?

      #assert
      expect(result).to eq false
    end

    it 'maximum distance is mandatory' do 
      #arrange
      type = TransportType.new(name:'Moto', minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)

      #act
      result = type.valid?

      #assert
      expect(result).to eq false
    end

    it 'minimum distance is mandatory' do 
      #arrange
      type = TransportType.new(name:'', maximum_distance: 100 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)

      #act
      result = type.valid?

      #assert
      expect(result).to eq false
    end

    it 'minimum weight is mandatory' do 
      #arrange
      type = TransportType.new(name:'Moto', maximum_distance: 100, minimum_distance: 10, maximum_weight: 30, flat_hate: 20)

      #act
      result = type.valid?

      #assert
      expect(result).to eq false
    end

    it 'maximum weight is mandatory' do 
      #arrange
      type = TransportType.new(name:'', maximum_distance: 100, minimum_distance: 10, minimum_weight: 500, flat_hate: 20)

      #act
      result = type.valid?

      #assert
      expect(result).to eq false
    end

    it 'flat hate is mandatory' do 
      #arrange
      type = TransportType.new(name:'', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30)

      #act
      result = type.valid?

      #assert
      expect(result).to eq false
    end

    it 'create ok' do 
      #arrange
      type = TransportType.new(name: 'Test', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)

      #act
      result = type.valid?

      #assert
      expect(result).to eq true
    end
 end
end
