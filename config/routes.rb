Rails.application.routes.draw do
  root to: 'home#index'
  resources :transport_types, only: [:show, :index, :new, :create] do 
    post 'active', on: :member
    post 'disable', on: :member
  end
end