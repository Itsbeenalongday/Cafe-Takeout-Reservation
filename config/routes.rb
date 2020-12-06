Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
  
  resources :orders do
    member do
      get :select_product
      #get :show_menu
    end
    collection do 
      get :cart_menu
      get :add_to_cart
      get :set_pickuptime
      get :remove_from_cart
      get :complete
    end 
  end
  resources :menus
  resources :payment
end
