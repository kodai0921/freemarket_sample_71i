Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :pays, only: [:new, :show] do
    collection do
      post 'show', to: 'pays#show'
      post 'pay', to: 'pays#pay'
      post 'delete', to: 'pays#delete'
    end
  end



  resources :users, only: [:show,:edit]
  

  resources :items, only: [:index, :new, :create, :show]

  resources :addressinfos, only: [:new, :create]
  resources :purchases, only: [:new]

end
