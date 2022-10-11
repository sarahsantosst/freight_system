require 'rails_helper'

describe 'Usuário edita um veículo' do 

  it 'a partir da página do veículo' do 
    #arrange
    user = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: true)
    type = TransportType.create!(name:'Moto', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    vehicle = Vehicle.create!(license_plate: 'CRISI02089', brand: 'Jeep', model: 'Renegade', manufacture_year: 2020, maximum_load_capacity: 200, transport_type: type)
    
    #act
    login_as(user)
    visit root_path
    click_on 'Veículo'
    click_on 'CRISI02089'
    click_on 'Editar'

    #assert
    expect(page).to have_content 'Editar'
    expect(page).to have_field('Placa de Identificação', with: 'CRISI02089')
    expect(page).to have_field('Marca', with: 'Jeep')
    expect(page).to have_field('Modelo', with: 'Renegade')
    expect(page).to have_field('Ano de fabricação', with: '2020')
    expect(page).to have_field('Capacidade Máxima', with: '200')
  end

  it 'com sucesso' do 
    #arrange
    user = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: true)
    type = TransportType.create!(name:'Moto', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    other_type = TransportType.create!(name:'Carro', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 45)
    vehicle = Vehicle.create!(license_plate: 'CRISI02089', brand: 'Jeep', model: 'Renegade', manufacture_year: 2020, maximum_load_capacity: 200, transport_type: type)

    #act
    login_as(user)
    visit root_path
    click_on 'Veículo'
    click_on 'CRISI02089'
    click_on 'Editar'

    select 'Carro', from: 'Tipo de Transporte'
    fill_in 'Placa de Identificação', with: 'CRISI02089'
    fill_in 'Marca', with:'VW'
    fill_in 'Modelo', with:'T-CROSS'
    fill_in 'Ano de fabricação', with:'2021'
    fill_in 'Capacidade Máxima', with:'300'
    click_on 'Atualizar'

    #assert
    expect(page).to have_content 'Veículo atualizado com sucesso'
    expect(page).to have_content 'Marca: VW'
    expect(page).to have_content 'Modelo: T-CROSS'
  end

  it 'e mantém os campos obrigatórios' do 
    #arrange
    user = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: true)
    type = TransportType.create!(name:'Moto', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    vehicle = Vehicle.create!(license_plate: 'CRISI02089', brand: 'Jeep', model: 'Renegade', manufacture_year: 2020, maximum_load_capacity: 200, transport_type: type)

    #act
    login_as(user)
    visit root_path
    click_on 'Veículo'
    click_on 'CRISI02089'
    click_on 'Editar'
    fill_in 'Placa de Identificação', with: ''
    fill_in 'Marca', with:''
  
    click_on 'Atualizar'

    #assert
    expect(page).to have_content 'Todos os campos são obrigatórios'
 end 
end
  
 