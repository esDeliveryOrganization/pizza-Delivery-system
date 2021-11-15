Rails.application.routes.draw do
  get 'cardapio/_index'
  get 'menu_cliente/index'
  resources :enderecos
  root 'home#index'

  devise_scope :user do
    get '/signup', to: 'users/registrations#new', as: :inactive_signup
    post '/users', to: 'users/registrations#create'
  end
  devise_for :users, controllers: { registrations: "registrations" }
  resources :sabors
end
