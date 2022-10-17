# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_admin = User.create!(name: "Admin", email:'admin@sistemadefrete.com.br', password:'password', admin: true)
user_non_admin = User.create!(name: "Non admin", email:'nonadmin@sistemadefrete.com.br', password:'password', admin: false)

transport_type_moto = TransportType.create!(name:'Moto', maximum_distance: 50, minimum_distance: 10 , minimum_weight: 2, maximum_weight: 300 , flat_hate: 20)
transport_type_carro = TransportType.create!(name:'Carro', maximum_distance: 50, minimum_distance: 10 , minimum_weight: 2, maximum_weight: 600, flat_hate: 20)
transport_type_caminhao = TransportType.create!(name:'Caminhão', maximum_distance: 3000, minimum_distance: 1000 , minimum_weight: 10, maximum_weight: 2000, flat_hate: 100)
transport_type_aviao = TransportType.create!(name:'Avião', maximum_distance: 70000, minimum_distance: 2000 , minimum_weight: 10, maximum_weight: 6000, flat_hate: 200)

vehicle = Vehicle.create!(license_plate: 'CRISI02089', brand: 'Jeep', model: 'Renegade', manufacture_year: 2020, maximum_load_capacity: 300, transport_type: transport_type_carro)
vehicle = Vehicle.create!(license_plate: 'PAIX34567', brand: 'RONDA', model: 'Pop110i', manufacture_year: 2018, maximum_load_capacity: 300, transport_type: transport_type_moto)
vehicle = Vehicle.create!(license_plate: 'CRISI02089', brand: 'Volkswagen', model: 'Cummins 6CT', manufacture_year: 2019, maximum_load_capacity: 5000, transport_type: transport_type_caminhao)
vehicle = Vehicle.create!(license_plate: 'PR-MUD', brand: 'GOL', model: 'Airbus A350', manufacture_year: 2020, maximum_load_capacity: 70000, transport_type: transport_type_aviao)

DeadlineConfig.create!(transport_type: transport_type_carro, minimum_range: 10, maximum_range: 300, value: 80 )
DeadlineConfig.create!(transport_type: transport_type_moto, minimum_range: 10, maximum_range: 600, value: 20 )
DeadlineConfig.create!(transport_type: transport_type_caminhao, minimum_range: 20, maximum_range: 2000, value: 100)
DeadlineConfig.create!(transport_type: transport_type_aviao, minimum_range: 200, maximum_range: 6000, value: 200 )

WeightConfig.create!(transport_type: transport_type_carro, minimum_range: 10, maximum_range: 300, value: 30)
WeightConfig.create!(transport_type: transport_type_moto, minimum_range: 10, maximum_range: 200, value: 20 )
WeightConfig.create!(transport_type: transport_type_caminhao, minimum_range: 20, maximum_range: 10000, value: 100)
WeightConfig.create!(transport_type: transport_type_aviao, minimum_range: 200, maximum_range: 6000, value: 200)

DistanceConfig.create!(transport_type: transport_type_carro, minimum_range: 1, maximum_range: 300, value: 30)
DistanceConfig.create!(transport_type: transport_type_moto, minimum_range: 1, maximum_range: 600, value: 20)
DistanceConfig.create!(transport_type: transport_type_caminhao, minimum_range: 20, maximum_range: 2000, value: 100)
DistanceConfig.create!(transport_type: transport_type_aviao, minimum_range: 200, maximum_range: 6000, value: 200)

ServiceOrder.create!(code: 'OS20221012195600', total_distance: 10,
product_weight: 20, product_width: 10, product_height: 2, product_depth: 10, 
sender_address_zip_code: '72010010', sender_address_full_address: 'C1', sender_address_city: 'Brasília',
sender_address_state: 'DF',destination_name: 'Sarah Santos', destination_document: '42922563999',
destination_address_zip_code: '71111888',destination_address_full_address: 'QWD 4',
destination_address_city: 'Brasília',destination_address_state: 'DF')


ServiceOrder.create!(code: 'OS20221012195600', total_distance: 3000,
product_weight: 500, product_width: 10, product_height: 2, product_depth: 10, 
sender_address_zip_code: '23010010', sender_address_full_address: 'Rua Minas Gerais', sender_address_city: 'Minas Gerais',
sender_address_state: 'MG',destination_name: 'Renato Silva', destination_document: '45622563439',
destination_address_zip_code: '08056707',destination_address_full_address: 'Rua Guariroba, 45',
destination_address_city: 'Minas Gerais',destination_address_state: 'MG')


ServiceOrder.create!(code: 'OS20221012195600', total_distance: 2000,
product_weight: 50, product_width: 2, product_height: 2, product_depth: 10, 
sender_address_zip_code: '72019910', sender_address_full_address: 'L3', sender_address_city: 'Brasília',
sender_address_state: 'DF',destination_name: 'Sarah Santos', destination_document: '429225630987',
destination_address_zip_code: '71111998',destination_address_full_address: 'Av Santos Dumont',
destination_address_city: 'Rio de Janeiro',destination_address_state: 'RJ')


