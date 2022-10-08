require 'rails_helper' 

describe 'Admin visita tela de tipos de transporte' do

  it 'e vê tipos de transportes cadastrados' do 
    #arrange
    TransportType.create!(name:'Moto', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    
    #act
    visit root_path
    click_on('Tipo de Transporte')
    
    #assert
    expect(page).not_to have_content('Não existem tipos de transportes cadastrados')
    expect(page).to have_content('Moto')
  end

  it 'e não existem tipos de transportes cadastrados' do 
    #act
    visit root_path
    click_on('Tipo de Transporte')
    
    #assert
    expect(page).to have_content ('Não existem tipos de transportes cadastrados')
 end

  it 'e vê informações adicionais do tipo de transporte selecionado' do 
    #arrange
    t = TransportType.new(name:'Moto', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    t.save

    #act
    visit root_path
    click_on('Tipo de Transporte')
    click_on('Moto')

    #assert
    expect(page).to have_content('Moto')
    expect(page).to have_content('Distância Máxima: 100')
    expect(page).to have_content('Distância Mínima: 10')
    expect(page).to have_content('Peso Mínimo: 500')
    expect(page).to have_content('Peso Máximo: 30')
    expect(page).to have_content('Taxa Fixa: 20')
  end
end