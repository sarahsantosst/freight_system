Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :transport_types, only: [:show, :index, :new, :create] do 
    post 'active', on: :member
    post 'disable', on: :member
  end
end