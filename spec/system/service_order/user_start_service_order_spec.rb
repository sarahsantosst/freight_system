require 'rails_helper'

describe 'Usuário entra na tela de ordem de serviço' do
  it 'e verifica se possui tipos de veículos para atender' do
    #arrange 
    s = ServiceOrder.create!(total_distance: 100,
    product_weight: 20, product_width: 10, product_height: 2, product_depth: 10, 
    sender_address_zip_code: '72010010', sender_address_full_address: 'C1', sender_address_city: 'Brasília',
    sender_address_state: 'DF',destination_name: 'Sarah Santos', destination_document: '42922563999',
    destination_address_zip_code: '71111888',destination_address_full_address: 'Rua 1',
    destination_address_city: 'Rio de Janeiro',destination_address_state: 'RJ')

    type = TransportType.create!(name:'Moto', maximum_distance: 1000, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    WeightConfig.create!(minimum_range: 10, maximum_range: 1000, value: 100, transport_type: type)
    DistanceConfig.create!(minimum_range: 10, maximum_range: 1000, value: 10, transport_type: type)
    DeadlineConfig.create!(minimum_range: 10, maximum_range: 1000, value: 10, transport_type: type)
    
    regular_user = User.create!(name: 'Sarah', email: 'sarah@sistemadefrete.com.br', password: 'password', admin: false)
  
    #act
    login_as(regular_user)
    visit root_path
    click_on('Ordem de Serviço')
    click_on "#{s.code}"
    
    #assert
    expect(page).to have_content 'Ordem de Serviço - Pendente'
    expect(page).to have_content 'Distância total: 100'
    expect(page).to have_content '20'
    expect(page).to have_content '10'
    expect(page).to have_content '2'
    expect(page).to have_content '2'
    expect(page).to have_content 'C1'
    expect(page).to have_content 'Brasília'
    expect(page).to have_content 'Sarah'
    expect(page).to have_content '42922563999'
    expect(page).to have_content 'Rua 1'
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content 'RJ'
    
    expect(page).to have_content 'Moto'
  end

  it 'e inicia uma ordem de serviço pendente' do
    #arrange 
    s = ServiceOrder.create!(total_distance: 100,
    product_weight: 20, product_width: 10, product_height: 2, product_depth: 10, 
    sender_address_zip_code: '72010010', sender_address_full_address: 'C1', sender_address_city: 'Brasília',
    sender_address_state: 'DF',destination_name: 'Sarah Santos', destination_document: '42922563999',
    destination_address_zip_code: '71111888',destination_address_full_address: 'Rua 1',
    destination_address_city: 'Rio de Janeiro',destination_address_state: 'RJ')

    type = TransportType.create!(name:'Carro', maximum_distance: 1000, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    WeightConfig.create!(minimum_range: 10, maximum_range: 1000, value: 100, transport_type: type)
    DistanceConfig.create!(minimum_range: 10, maximum_range: 1000, value: 10, transport_type: type)
    DeadlineConfig.create!(minimum_range: 10, maximum_range: 1000, value: 10, transport_type: type)
    Vehicle.create!(license_plate: 'CRISI02089', brand: 'Jeep', model: 'Renegade', manufacture_year: 2020, maximum_load_capacity: 200, transport_type: type)

    regular_user = User.create!(name: 'Sarah', email: 'sarah@sistemadefrete.com.br', password: 'password', admin: false)
  
    #act
    login_as(regular_user)
    visit root_path
    click_on('Ordem de Serviço')
    click_on "#{s.code}"
    click_on('Carro')
    
    #assert
    expect(page).to have_content 'Ordem de serviço iniciada com sucesso.'
  end

  it 'e tenta iniciar uma ordem de serviço mas não tem veículo disponível' do
    #arrange 
    s = ServiceOrder.create!(total_distance: 100,
    product_weight: 20, product_width: 10, product_height: 2, product_depth: 10, 
    sender_address_zip_code: '72010010', sender_address_full_address: 'C1', sender_address_city: 'Brasília',
    sender_address_state: 'DF',destination_name: 'Sarah Santos', destination_document: '42922563999',
    destination_address_zip_code: '71111888',destination_address_full_address: 'Rua 1',
    destination_address_city: 'Rio de Janeiro',destination_address_state: 'RJ')

    type = TransportType.create!(name:'Carro', maximum_distance: 1000, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    WeightConfig.create!(minimum_range: 10, maximum_range: 1000, value: 100, transport_type: type)
    DistanceConfig.create!(minimum_range: 10, maximum_range: 1000, value: 10, transport_type: type)
    DeadlineConfig.create!(minimum_range: 10, maximum_range: 1000, value: 10, transport_type: type)

    regular_user = User.create!(name: 'Sarah', email: 'sarah@sistemadefrete.com.br', password: 'password', admin: false)
  
    #act
    login_as(regular_user)
    visit root_path
    click_on('Ordem de Serviço')
    click_on "#{s.code}"
    click_on('Carro')
    
    #assert
    expect(page).to have_content 'Nenhum veículo disponível.'
  end
end