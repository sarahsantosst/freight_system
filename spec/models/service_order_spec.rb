require 'rails_helper'

RSpec.describe ServiceOrder, type: :model do
  # describe '#valid?' do 
  #   it 'deve ter um código' do 
  #     #arrange
  #     admin = User.create!(name: 'Admin', email: 'sarah@sistemadefrete.com.br',
  #     password: 'password', admin: true)
  #     ServiceOrder.create!(code: 'OS20221012195600', total_distance: 1000,
  #     product_weight: 20, product_width: 10, product_height: 10, product_depth: 10, 
  #     sender_address_zip_code: '72010010', sender_address_full_address: 'C1', sender_address_city: 'Brasília',
  #     sender_address_state: 'DF',destination_name: 'Sarah Santos', destination_document: '42922563999',
  #     destination_address_zip_code: '71111888',destination_address_full_address: 'Rua tal',
  #     destination_address_city: 'Rio de Janeiro',destination_address_state: 'RJ')
      
  #     #act
  #   it 'obrigatória' do 
  #     #arrange
  #     order = Order.new(estimated_delivery_date: '')
  #     #act
  #     order.valid?
  #     result = order.errors.include?(:estimated_delivery_date)
  #     #assert
  #     expect(result).to be true
  #   end

  #   it 'data estimada de entrega não deve ser antiga' do 
  #     #arrange
  #     order = Order.new(estimated_delivery_date: 1.day.ago)
  #     #act
  #     order.valid?
  #     #assert
  #     expect(order.errors.include?(:estimated_delivery_date)).to be true
  #     expect(order.errors[:estimated_delivery_date]).to include(" deve ser futura.")
  #   end

  #   it 'data estimada de entrega não deve ser igual a hoje' do 
  #     #arrange
  #     order = Order.new(estimated_delivery_date: Date.today)
  #     #act
  #     order.valid?
  #     result = order.errors.include?(:estimated_delivery_date)
  #     #assert
  #     expect(order.errors.include?(:estimated_delivery_date)).to be true
  #     expect(order.errors[:estimated_delivery_date]).to include(" deve ser futura.")
  #   end

  #   it 'data estimada de entrega  deve ser igual ou maior que amanhã' do 
  #     #arrange
  #     order = Order.new(estimated_delivery_date: 1.day.from_now)
  #     #act
  #     order.valid?
  #     result = order.errors.include?(:estimated_delivery_date)
  #     #assert
  #     expect(order.errors.include?(:estimated_delivery_date)).to be false
  #   end
  # end 

  # describe 'gera um código aleatório' do 
  #   it 'ao criar um novo pedido' do 
  #     #arrange
  #     user = User.create!(name: 'Sergio',
  #       email: 'sergio@email.com', password:'12345678') 
  #     warehouse = Warehouse.create!(name: 'Santos Dumont', code: 'RIO', address:'Endereço',
  #     cep:'25000-000', 
  #     city:'Rio', 
  #     area: 10000, 
  #     description: 'Alguma descriçao')
  #     supplier = Supplier.create!(corporate_name:'ACME LTDA',
  #     brand_name: 'ACME', 
  #     registration_number:'4344721600',
  #     full_address:'Av das Palmas, 100',
  #     city:'Bauru', 
  #     state: 'SP', 
  #     email: 'contato@acme.com')
  #     order = Order.new(user: user, 
  #     warehouse: warehouse, supplier: supplier, estimated_delivery_date: '2022-10-25'  )
  #     #act
  #     order.save!
  #     result = order.coderesult = order.valid?
  #     #assert
  #     expect(result).to be false
  #   end
  #     #assert
  #     expect(result).not_to be_empty
  #     expect(result.length).to eq 8
  #   end  

  #   it 'e o código é único' do 
  #     #arrange
  #     user = User.create!(name: 'Sergio',
  #       email: 'sergio@email.com', password:'12345678') 
  #     warehouse = Warehouse.create!(name: 'Santos Dumont', code: 'RIO', address:'Endereço',
  #     cep:'25000-000', 
  #     city:'Rio', 
  #     area: 10000, 
  #     description: 'Alguma descriçao')

  #     supplier = Supplier.create!(corporate_name:'ACME LTDA',
  #     brand_name: 'ACME', 
  #     registration_number:'4344721600',
  #     full_address:'Av das Palmas, 100',
  #     city:'Bauru', 
  #     state: 'SP', 
  #     email: 'contato@acme.com')

  #     first_order = Order.create!(user: user, warehouse: warehouse, supplier: supplier, estimated_delivery_date: '2023-10-01')

  #     second_order = Order.create!(user: user, 
  #       warehouse: warehouse, supplier: supplier, estimated_delivery_date: '2022-10-25')
  #     #act
  #     second_order.save!
      
  #     #assert
  #     expect(second_order.code).not_to eq first_order.code
  #   end  

  #  it 'e não deve ser modificado' do
  #   #arrange 
  #   user = User.create!(name: 'Sergio',
  #     email: 'sergio@email.com', password:'12345678') 
  #   warehouse = Warehouse.create!(name: 'Santos Dumont', code: 'RIO', address:'Endereço',
  #   cep:'25000-000', 
  #   city:'Rio', 
  #   area: 10000, 
  #   description: 'Alguma descriçao')
  #   supplier = Supplier.create!(corporate_name:'ACME LTDA',
  #   brand_name: 'ACME', 
  #   registration_number:'4344721600',
  #   full_address:'Av das Palmas, 100',
  #   city:'Bauru', 
  #   state: 'SP', 
  #   email: 'contato@acme.com')
  #   order = Order.create!(user: user, 
  #   warehouse: warehouse, supplier: supplier, estimated_delivery_date:  1.week.from_now)
  #   original_code = order.code
  #   #actt
  #   order.update!(estimated_delivery_date: 1.month.from_now)
  #   #assert
  #   expect(order.code).to eq(original_code)
  #   end
  # end
end

