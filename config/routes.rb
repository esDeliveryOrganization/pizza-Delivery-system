Rails.application.routes.draw do
  get 'cardapio/_index'
  get 'menu_cliente/index'
  resources :enderecos
  root 'home#index'
  devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :user do
    get '/signup', to: 'users/registrations#new', as: :inactive_signup
  end
  
  resources :sabors
end
