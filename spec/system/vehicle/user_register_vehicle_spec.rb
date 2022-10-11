require 'rails_helper'

describe 'Administrador cadastra um novo veículo' do 
  it 'com sucesso' do 
    #arrange
    user = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: true)
    TransportType.create!(name:'Carro', maximum_distance: 100, minimum_distance: 10 , minimum_weight: 500, maximum_weight: 30, flat_hate: 20)

    #act
    login_as(user)
    visit root_path
    click_on 'Veículo'
    click_on 'Cadastrar Veículo'
    select 'Carro', from: 'Tipo de Transporte'
    fill_in 'Placa de Identificação', with: 'AMD33456'
    fill_in 'Marca', with: 'Fiat'
    fill_in 'Modelo', with: 'UNO'
    fill_in 'Ano de fabricação', with: 2011
    fill_in 'Capacidade Máxima', with: 30000
    click_on 'Cadastrar'
  
    #assert
    expect(page).to have_content 'Veículo cadastrado com sucesso.'
    expect(page).to have_content 'Placa de Identificação: AMD33456'
    expect(page).to have_content 'Marca: Fiat'
    expect(page).to have_content 'Modelo: UNO' 
    expect(page).to have_content 'Ano de Fabricação: 2011'
    expect(page).to have_content 'Capacidade Máxima: 30000'
    expect(page).to have_content 'Tipo de Transporte: Carro'
  end

  it 'com dados incompletos' do 
    #arrange
    user = User.create!(name: 'Joao', email:'joao@sistemadefrete.com.br', password:'password', admin: true)

    #act
    login_as(user)
    visit root_path
    click_on 'Veículo'
    click_on 'Cadastrar Veículo'
    fill_in 'Placa de Identificação', with: ''
    fill_in 'Marca', with: ''
    fill_in 'Modelo', with: ''
    fill_in 'Ano de fabricação', with: ''
    fill_in 'Capacidade Máxima', with: ''
    click_on 'Cadastrar'

    #assert 
    expect(page).to have_content 'Veículo não cadastrado'
    expect(page).to have_content 'Tipo de Transporte é obrigatório(a)'
    expect(page).to have_content 'Placa de Identificação não pode ficar em branco'
    expect(page).to have_content 'Marca não pode ficar em branco'
    expect(page).to have_content 'Modelo não pode ficar em branco'
    expect(page).to have_content 'Ano de fabricação não pode ficar em branco'
    expect(page).to have_content 'Capacidade Máxima não pode ficar em branco'
  end

  it 'e não é Administrador' do
    #assert
    user = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: false)

    #act
    login_as(user)
    visit root_path
    click_on 'Veículo'

    #assert 
    expect(page).not_to have_content 'Cadastrar Veículo'
  end
end
