Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addressinfos', to: 'users/registrations#new_addressinfo'
    post 'addressinfos', to: 'users/registrations#create_addressinfo'
  end
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :pays, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end



  resources :users, only: [:show,:edit]
  resources :items, only: [:index, :new, :create, :show]
  resources :purchases, only: [:new]

end
