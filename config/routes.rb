Rails.application.routes.draw do
  resources :sabors
  root 'sabors#index'
end
