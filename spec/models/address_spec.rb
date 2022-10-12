require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#valid?' do 
    it 'CEP is mandatory' do 
      #arrange
      address = Address.new( full_address:'Avenida do Porto, 1000 ', city: 'Rio de Janeiro', state: 'RJ')

      #act
      result = address.valid?

      #assert
      expect(result).to eq false
    end

    it ' state is mandatory' do 
      #arrange
      
      address = Address.new(zip_code:'', full_address:'Avenida do Porto, 1000 ', zip_code: '45678098', city: 'Rio de Janeiro')

      #act
      result = address.valid?

      #assert
      expect(result).to eq false
    end

    it ' cidade is mandatory' do 
      #arrangety

     address = Address.new(zip_code:'', full_address:'Avenida do Porto, 1000 ', zip_code: '45678098',  state: 'RJ')

      #act
      result = address.valid?

      #assert
      expect(result).to eq false
     end

    it 'create ok' do 
      #arrange
      address = Address.new(zip_code:'45678098', full_address:'Avenida do Porto, 1000 ', zip_code: '45678098', city: 'Rio de Janeiro', state: 'RJ')
      #act
      result = address.valid?

      #assert
      expect(result).to eq true
    end
 end
end
