require 'rails_helper'

describe 'Administrador cadastra uma nova ordem de serviço' do 
  it 'a partir do menu' do 
    #arrange
    admin = User.create!(name: 'Admin', email: 'sarah@sistemadefrete.com.br', password: 'password', admin: true)
    ServiceOrder.create!(code: 'OS20221012195600', total_distance: 1000,
    product_weight: 20, product_width: 10, product_height: 2, product_depth: 10, 
    sender_address_zip_code: '72010010', sender_address_full_address: 'C1', sender_address_city: 'Brasília',
    sender_address_state: 'DF',destination_name: 'Sarah Santos', destination_document: '42922563999',
    destination_address_zip_code: '71111888',destination_address_full_address: 'Rua 1',
    destination_address_city: 'Rio de Janeiro',destination_address_state: 'RJ')

    allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('ADSGTHDEVBKILPQ')
    allow(SecureRandom).to receive(:alphanumeric).with(8).and_return('ADSGTHDE')

    #act
    login_as(admin)
    visit root_path
    click_on('Ordem de Serviço')
    click_on('Cadastrar Nova Ordem de Serviço')
    fill_in 'Distância Total', with: '100'
    fill_in 'Peso do Produto', with: '20'
    fill_in 'Comprimento do Produto', with:'10'
    fill_in 'Altura do Produto', with: '2'
    fill_in 'Profundidade do Produto', with: '10'
    fill_in 'Altura do Produto', with: '2'
    fill_in 'CEP Remetente', with: '72010010'
    fill_in 'Endereço Remetente', with: 'C1'
    fill_in 'Cidade Remetente', with: 'Brasília'
    select 'DF', from: 'Estado'
    fill_in 'Nome do Destinatário', with: 'Sarah'
    fill_in 'Documento', with: '42922563999'
    fill_in 'CEP Destino', with: '71111888'
    fill_in 'Endereço Destinatário', with: 'Rua 1'
    fill_in 'Cidade Destino', with: 'Rio de Janeiro'
    select 'RJ', from: 'Estado Destino'
    click_on 'Cadastrar'

    #assert
    expect(page).to have_content 'Ordem de serviço cadastrada com sucesso.'
    expect(page).to have_content 'ADSGTHDEVBKILPQ'
    expect(page).to have_content 'Distância total: 100'
    expect(page).to have_content 'ADSGTHDE'
    expect(page).to have_content '20'
    expect(page).to have_content '10'
    expect(page).to have_content '2'
    expect(page).to have_content '2'
    expect(page).to have_content 'C1'
    expect(page).to have_content 'Brasília'
    expect(page).to have_content 'Sarah'
    expect(page).to have_content '42922563999'
    expect(page).to have_content 'Rua 1'
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content 'RJ'
    expect(page).to have_content 'Tipos de transporte disponíveis'
  end
end 
  