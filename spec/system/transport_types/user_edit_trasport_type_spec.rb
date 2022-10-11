require 'rails_helper'

describe 'Usuário edita um tipo de transporte' do 

  it 'a partir da página de tipo de transporte' do 
    #arrange
    user = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: true)
    type = TransportType.create!(name:'Moto', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    
    #act
    login_as(user)
    visit root_path
    click_on 'Tipo de Transporte'
    click_on 'Moto'
    click_on 'Editar'

    #assert
    expect(page).to have_content 'Editar'
    expect(page).to have_field('Nome', with: 'Moto') 
    expect(page).to have_field('Distância Máxima', with: '100')
    expect(page).to have_field('Distância Mínima', with: '10')
    expect(page).to have_field('Peso Mínimo', with: '500')
    expect(page).to have_field('Peso Máximo', with: '30')
    expect(page).to have_field('Taxa Fixa', with: '20')
  end

  it 'com sucesso' do 
    #arrange
    user = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: true)
    type = TransportType.create!(name:'Moto', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)

    #act
    login_as(user)
    visit root_path
    click_on 'Tipo de Transporte'
    click_on 'Moto'
    click_on 'Editar'

    fill_in 'Nome', with: 'Moto'
    fill_in 'Distância Máxima', with: '100'
    fill_in 'Distância Mínima', with:  '10'
    fill_in 'Peso Mínimo', with:  '50'
    fill_in 'Peso Máximo', with:  '30'
    fill_in 'Taxa Fixa', with:  '15'
    click_on 'Atualizar'

    #assert
    expect(page).to have_content 'Tipo de Transporte atualizado com sucesso'
    expect(page).to have_content 'Peso Máximo: 30'
    expect(page).to have_content 'Taxa Fixa: 15'
  end

  it 'e mantém os campos obrigatórios' do 
    #arrange
    user = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: true)
    type = TransportType.create!(name:'Moto', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)

    #act
    login_as(user)
    visit root_path
    click_on 'Tipo de Transporte'
    click_on 'Moto'
    click_on 'Editar'
    fill_in 'Peso Máximo', with:  ''
    fill_in 'Taxa Fixa', with:  ''
    click_on 'Atualizar'

    #assert
    expect(page).to have_content 'Todos os campos são obrigatórios'
 end 
end
  
 