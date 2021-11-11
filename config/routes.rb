Rails.application.routes.draw do
  get 'menu_cliente/index'
  resources :enderecos
  root 'home#index'
  devise_for :users
  resources :sabors
  #root 'sabors#index'
end
