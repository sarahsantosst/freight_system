require 'rails_helper'

describe 'Usuario visita página de configuração de prazo' do 
  it 'e vê a as configurações de prazo' do 
    #arrange
    user = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: true)

    #act
    login_as(user)
    visit root_path
    click_on 'Configuração de Prazo'

    #assert 
    expect(page).to have_content('Não existem configurações de prazo')
  end  
end