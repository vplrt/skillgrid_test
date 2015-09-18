Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users
  resources :products

  root 'products#index'
end
