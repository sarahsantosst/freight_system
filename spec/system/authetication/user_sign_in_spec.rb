require 'rails_helper'

describe 'Usuário se autentica' do 
  it 'com sucesso' do 
    #arrange
    User.create!(name: 'Sarah Santos', email: 'sarah@sistemadefrete.com.br', password: 'password')

    #act
    visit root_path
    click_on 'Fazer login'
    
    within('form') do 
      fill_in 'E-mail', with: 'sarah@sistemadefrete.com.br'
      fill_in  'Senha', with: 'password'
      click_on 'Entrar'
    end

    #assert
    expect(page).to have_content 'Login efetuado com sucesso.'
    expect(page).not_to have_link 'Fazer login'
    expect(page).to have_button 'Sair'
    within('nav') do
      expect(page).to have_content 'Sarah Santos - sarah@sistemadefrete.com.br'
    end
  end

  it 'e faz logout' do 
    #arrange
    User.create!(name: 'John Doe', email:'johndoe@sistemadefrete.com.br', password:'password')
    
    #act
    visit root_path
    click_on 'Fazer login'
    fill_in 'E-mail', with: 'johndoe@sistemadefrete.com.br'
    fill_in 'Senha', with: 'password'
    within('form') do
      click_on 'Entrar'
    end
    click_on 'Sair'

    #assert
    expect(page).to have_content 'Logout efetuado com sucesso.'
  end
end
