require 'rails_helper'

describe 'Administrador cadastra um novo tipo de transporte' do 
  it 'a partir do menu' do 
    #act
    visit root_path
    click_on('Tipo de Transporte')
    click_on('Cadastrar Tipo de Transporte')

    #assert
    expect(page).to have_field('Nome') 
    expect(page).to have_field('Distância Máxima')
    expect(page).to have_field('Distância Mínima')
    expect(page).to have_field('Peso Mínimo')
    expect(page).to have_field('Peso Máximo')
    expect(page).to have_field('Taxa Fixa')
  end

  it 'com sucesso' do 
    #act
    visit root_path
    click_on('Tipo de Transporte')
    click_on('Cadastrar Tipo de Transporte')

    fill_in 'Nome', with: 'Moto'
    fill_in 'Distância Máxima', with: '100'
    fill_in 'Distância Mínima', with:  '10'
    fill_in 'Peso Mínimo', with:  '500'
    fill_in 'Peso Máximo', with:  '30'
    fill_in 'Taxa Fixa', with:  '20'
   
    click_on 'Cadastrar'

    #assert
    expect(page).to have_content('Tipo de Transporte cadastrado com sucesso')
    expect(page).to have_content('Moto')
  end 
  
  it 'com dados incompletos' do 
    #act
    visit root_path
    click_on('Tipo de Transporte')
    click_on('Cadastrar Tipo de Transporte')
    
    fill_in 'Nome', with: ''
    fill_in 'Distância Máxima', with: ''
    fill_in 'Distância Mínima', with:  ''
    fill_in 'Peso Mínimo', with:  ''
    fill_in 'Peso Máximo', with:  ''
    fill_in 'Taxa Fixa', with:  ''
    click_on 'Cadastrar'

    #assert 
    expect(page).to have_content 'Tipo de Transporte não cadastrado'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'Distância Máxima não pode ficar em branco'
    expect(page).to have_content 'Distância Mínima não pode ficar em branco'
  end
end  