Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index]
  resources :addresses, only: [:new, :create]
end
