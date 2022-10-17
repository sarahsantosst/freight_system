require 'rails_helper'

describe 'Usuário cria conta' do 
  it 'com sucesso' do
    #act
    visit root_path
    click_on 'Fazer login'
    click_on 'Criar uma conta'
    fill_in 'Nome', with:'Maria'
    fill_in 'E-mail', with:'maria@sistemadefrete.com.br'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    #assert
    expect(page).to have_content 'Você realizou seu registro com sucesso.'
    expect(page).to have_content 'Maria - maria@sistemadefrete.com.br'
    expect(page).to have_button 'Sair'
    user = User.last
    expect(user.email).to eq 'maria@sistemadefrete.com.br'
    expect(user.name).to eq 'Maria'
  end

  it 'com email inválido' do
    #act
    visit root_path
    click_on 'Fazer login'
    click_on 'Criar uma conta'
    fill_in 'Nome', with:'João'
    fill_in 'E-mail', with:'joao@email.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    #assert
    expect(page).to have_content 'E-mail não é válido'
  end

  it 'de administrador com sucesso' do
    #act
    visit root_path
    click_on 'Fazer login'
    click_on 'Criar uma conta'
    fill_in 'Nome', with:'Admin'
    fill_in 'E-mail', with:'admin@sistemadefrete.com.br'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    check 'Admin'
    click_on 'Criar conta'

    #assert
    expect(page).to have_content 'Você realizou seu registro com sucesso.'
    expect(page).to have_content 'Admin - admin@sistemadefrete.com.br'
    expect(page).to have_button 'Sair'
    user = User.last
    expect(user.email).to eq 'admin@sistemadefrete.com.br'
    expect(user.name).to eq 'Admin'
    expect(user.admin).to eq true
  end
end