require 'rails_helper'

describe 'Usuario visita tela inicial' do 
  it 'e vê o nome do app' do 
    #act
    visit root_path

    #assert 
    expect(page).to have_content('Sistema de Frete')
  end

  it 'se estiver autenticado' do 
    #act
    visit root_path

    #assert 
    expect(current_path).to eq new_user_session_path
  end

end