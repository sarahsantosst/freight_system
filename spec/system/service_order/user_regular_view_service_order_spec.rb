require 'rails_helper'

describe 'Usuário visualiza página de ordens de serviços' do
  it 'a partir do menu' do
    #arrange 
    regular_user= User.create!(name: 'Admin', email: 'sarah@sistemadefrete.com.br', password: 'password', admin: false)

    #act
    login_as(regular_user)
    visit root_path
    click_on 'Ordem de Serviço'
    
    #assert
    expect(page).to have_content 'Ordem de Serviço'
  end

  it 'e vê ordens de serviços pendentes' do
    #arrange
    admin = admin = User.create!(name: 'Admin', email: 'maria@sistemadefrete.com.br', password: 'password', admin: true)
    
    ServiceOrder.create!(total_distance: 1000,
    product_weight: 20, product_width: 10, product_height: 2, product_depth: 10, 
    sender_address_zip_code: '72010010', sender_address_full_address: 'C1', sender_address_city: 'Brasília',
    sender_address_state: 'DF',destination_name: 'Sarah Santos', destination_document: '42922563999',
    destination_address_zip_code: '71111888',destination_address_full_address: 'Rua 1',
    destination_address_city: 'Rio de Janeiro',destination_address_state: 'RJ')

    regular_user = User.create!(name: 'Admin', email: 'sarah@sistemadefrete.com.br', password: 'password', admin: false)

    #act
    login_as(regular_user)
    visit root_path
    click_on 'Ordem de Serviço'

    #assert
    expect(page).to have_content 'Pendente'
  end
end


