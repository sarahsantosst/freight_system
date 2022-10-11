Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :transport_types, only: [:show, :index, :new, :create, :edit, :update] do 
    post 'active', on: :member
    post 'disable', on: :member
  end
  resources :vehicles, only: [:show, :index, :new, :create, :edit, :update] do 
    get 'search', on: :collection
    post 'active', on: :member
    post 'disable', on: :member
  end
end