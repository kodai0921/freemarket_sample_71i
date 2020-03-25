Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addressinfos', to: 'users/registrations#new_addressinfo'
    post 'addressinfos', to: 'users/registrations#create_addressinfo'
  end
  root to: 'items#index'
  resources :items, only: [:index, :new, :create]
end
