Rails.application.routes.draw do
  resources :enderecos
  root 'home#index'
  devise_for :users
  resources :sabors
  #root 'sabors#index'
end
