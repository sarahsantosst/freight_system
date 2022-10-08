require 'rails_helper' 

describe 'Usuário visita tela de tipo de transporte cadastrado' do 
   it ' e desativa e ativa o tipo de transporte' do 
    #arrange
    TransportType.create!(name:'Moto', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)

    #act
    visit root_path
    click_on 'Tipo de Transporte'
    click_on 'Moto'
    click_on 'Desativar'
    click_on 'Moto'

    #assert
    expect(page).to have_content 'Ativo: false'
   end
 end


