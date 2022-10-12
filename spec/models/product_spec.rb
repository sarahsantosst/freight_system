require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#valid?' do 
    it 'code is mandatory' do 
      #arrange
      product = Product.new( weight: 40, height: 10, depth: 15)

      #act
      result = product.valid?

      #assert
      expect(result).to eq false
    end

    it 'weight is mandatory' do 
      #arrange
      product = Product.new(code:'ABC4567', height: 10, depth: 15)

      #act
      result = product.valid?

      #assert
      expect(result).to eq false
    end

    it 'height is mandatory' do 
      #arrange
      product = Product.new(code:'ABC4567', weight:'40', depth: 15)

      #act
      result = product.valid?

      #assert
      expect(result).to eq false
    end

    it 'depth is mandatory' do 
      #arrange
      product = Product.new(code:'ABC4567', weight: 40, height: 10)
      
      #act
      result = product.valid?

      #assert
      expect(result).to eq false
    end

    it 'create ok' do 
      #arrange
      product = Product.new(code:'ABC4567', weight: 40, height: 10, depth: 15)
      
      #act
      result = product.valid?

      #assert
      expect(result).to eq true
    end
  end
end
