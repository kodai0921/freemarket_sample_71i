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

  resource "items", path: "sell", only: :show, action: :new, as: "new_items"
  resource "items", path: "sell", only: :create
  resource "items", only: :edit, path: "/m:item_id"
  resource "items", only: :destroy, path: "/m:item_id",as: "items_destroy"
  resource "items", only: :update, path: "/m:item_id",as: "items_update"
  
  resource :items,  only: :show_mine, path: "m:item_id" do
    collection do
      get 'show_mine'
    end
  end



  resources :pays, only: [:new, :edit]
  resources :users, only: [:show,:edit]
  resources :purchases, only: [:new]

end
