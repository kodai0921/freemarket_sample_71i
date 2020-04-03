Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addressinfos', to: 'users/registrations#new_addressinfo'
    post 'addressinfos', to: 'users/registrations#create_addressinfo'
  end
  root to: 'items#index'

  resources :items, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    resources :purchases, only: [:new]

    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :pays, only: [:new, :show] do
    collection do
      post 'show', to: 'pays#show'
      post 'pay', to: 'pays#pay'
      post 'delete', to: 'pays#delete'
    end
  end



  resources :users, only: [:show,:edit]
  resources :items, only: [:index, :new, :create, :show, :edit, :update]

  resources :addressinfos, only: [:new, :create]
  resources :purchases, only: [:index, :new] do
    collection do
      get 'index', to: 'purchases#index'
      post 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'
    end
  end


end
