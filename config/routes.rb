Rails.application.routes.draw do
  devise_for :admins
  devise_for :sellers
  devise_for :users
  resources :products

  get '/products/:id/buy', to: 'products#buy', as: 'buy_product'

  root 'products#index'
end
