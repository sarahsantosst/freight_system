require 'rails_helper'

describe 'Usuario visita página de configuração de distância' do 
  it 'e vê a as configurações de distância' do 
    #arrange
    user = User.create!(name: "Joao", email:'joao@sistemadefrete.com.br', password:'password', admin: true)

    #act
    login_as(user)
    visit root_path
    click_on 'Configuração de Distância'

    #assert 
    expect(page).to have_content('Não existem configurações de distância')
  end  
end