Rails.application.routes.draw do
  get 'cardapio/_index'
  get 'menu_cliente/index'
  get 'clientes' => 'menu_adm#getClientes'
  get 'adms' => 'menu_adm#getAdms'
  resources :enderecos
  root 'home#index'
  devise_scope :user do
    get '/signup', to: 'users/registrations#new', as: :inactive_signup
    post '/users', to: 'users/registrations#create'
    get '/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session_path
  end
  devise_for :users, controllers: { registrations: "registrations" }
  resources :sabors
end
