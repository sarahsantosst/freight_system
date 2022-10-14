require 'rails_helper'

describe 'Usuário visualiza página de ordens de serviços' do
  it 'a partir do menu' do
    #arrange 
    admin = User.create!(name: 'Admin', email: 'sarah@sistemadefrete.com.br', password: 'password', admin: true)

    #act
    login_as(admin)
    visit root_path
    click_on 'Ordem de Serviço'
    
    #assert
    expect(page).to have_content 'Ordem de Serviço'
  end

  it 'e não existe ordem de serviço disponíveis' do
    #arrange
    admin = User.create!(name: 'Admin', email: 'sarah@sistemadefrete.com.br', password: 'password', admin: true)

    #act
    login_as(admin)
    visit root_path
    click_on 'Ordem de Serviço'

    #assert
    expect(page).to have_content 'Não existem ordem de serviço cadastradas'
  end
end


