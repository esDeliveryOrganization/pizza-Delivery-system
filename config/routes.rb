Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :sabors
  #root 'sabors#index'
end
