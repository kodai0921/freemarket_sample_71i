Rails.application.routes.draw do
  root to: 'items#index'

  resources :items, only: [:index]
  resources :users, only: [:show,:edit]
end
