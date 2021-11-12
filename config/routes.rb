Rails.application.routes.draw do
  get 'cardapio/_index'
  get 'menu_cliente/index'
  resources :enderecos
  root 'home#index'
  devise_for :users
  resources :sabors
  #root 'sabors#index'
end
