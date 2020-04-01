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

  resources :pays, only: [:new, :edit]
  resources :users, only: [:show,:edit]
  resources :purchases, only: [:new]

end
