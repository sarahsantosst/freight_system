require 'rails_helper' 
  
describe 'Usuário busca por um veículo' do 
  it 'a partir da página de veículo' do 
    #arrange
    user = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: true)
    type = TransportType.create!(name:'Carro', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    vehicle = Vehicle.create!(license_plate: 'CRISI02089', brand: 'Jeep', model: 'Renegade', manufacture_year: 2020, maximum_load_capacity: 200, transport_type: type)
    
    #act
    login_as(user)
    visit root_path
    click_on 'Veículo'

    #assert
    expect(page).to have_field('Digite a placa')
    expect(page).to have_button('Buscar')
  end

  it 'e encontra um veículo' do 
    #arrange
    user = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: true)
    type = TransportType.create!(name:'Carro', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    vehicle = Vehicle.create!(license_plate: 'CRISI02089', brand: 'Jeep', model: 'Renegade', manufacture_year: 2020, maximum_load_capacity: 200, transport_type: type)

    #act
    login_as(user)
    visit root_path
    click_on 'Veículo'
    fill_in 'Digite a placa', with: vehicle.license_plate
    click_on 'Buscar'

    #assert
    expect(page).to have_content "Resultado da Busca por: #{vehicle.license_plate}"
    expect(page).to have_content 'Veículos encontrados: 1'
    expect(page).to have_content "#{vehicle.license_plate}"
  end
end
