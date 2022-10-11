require 'rails_helper' 

describe 'Usuário visita tela de veículo cadastrado' do 
   it 'e desativa e ativa o veículo' do 
    #arrange
    admin = User.create!(name: 'Admin', email: 'sarah@sistemadefrete.com.br', password: 'password', admin: true)
    type = TransportType.create!(name:'Moto', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    Vehicle.create!(license_plate: 'CRISI02089', brand: 'Jeep', model: 'Renegade', manufacture_year: 2020, maximum_load_capacity: 200, transport_type: type)

    #act
    login_as(admin)
    visit root_path
    click_on 'Veículo'
    click_on 'CRISI02089'
    click_on 'Em manutenção'
    click_on 'CRISI02089'

    #assert
    expect(page).to have_content 'Ativo: false'
   end
 end


