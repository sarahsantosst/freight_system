require 'rails_helper'

describe 'Administrador cadastra uma configuração de peso' do 
  it 'a partir do menu' do 
    #arrange
    admin = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: true)

    #act
    login_as(admin)
    visit root_path
    click_on('Configuração de Peso')
    click_on('Nova Configuração de Peso')

    #assert
    expect(page).to have_field('Tipo de Transporte') 
    expect(page).to have_field('Peso Mínimo')
    expect(page).to have_field('Peso Máximo')
    expect(page).to have_field('Valor')
  end

  it 'com sucesso' do 
    #arrange
    TransportType.create(name:'Carro', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)
    admin = User.create!(name: 'Admin', email: 'sarah@sistemadefrete.com.br', password: 'password', admin: true)

    #act
    login_as(admin)
    visit root_path
    click_on('Configuração de Peso')
    click_on('Nova Configuração de Peso')

    select 'Carro', from: 'Tipo de Transporte'
    fill_in 'Peso Mínimo', with: '100'
    fill_in 'Peso Máximo', with:  '10'
    fill_in 'Valor', with: '30'
    click_on 'Cadastrar'

    #assert
    expect(page).to have_content('Configuração de peso cadastrado com sucesso')
  end 
  
  it 'com dados incompletos' do 
    #arrange
    admin = User.create!(name: 'Admin', email: 'sarah@sistemadefrete.com.br', password: 'password', admin: true)

    #act
    login_as(admin)
    visit root_path
    click_on('Configuração de Peso')
    click_on('Nova Configuração de Peso')
    fill_in 'Peso Mínimo', with: ''
    fill_in 'Peso Máximo', with:  '10'
    fill_in 'Valor', with: '30'
    click_on 'Cadastrar'

    #assert 
    expect(page).to have_content 'Configuração de peso não cadastrado'
    expect(page).to have_content 'Tipo de Transporte não pode ficar em branco'
    expect(page).to have_content 'Peso Mínimo não pode ficar em branco'
  end
end  