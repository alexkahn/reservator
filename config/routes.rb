Rails.application.routes.draw do

  devise_for :users

  root 'home#index'

  resources :restaurants do
    resources :reservations
    resources :stars, only: [:create, :destroy]
  end

  resources :reservations

  get '/owner', to: 'home#owner_dashboard'
  get '/patron', to: 'home#patron_dashboard'

  resources :stars, only: :index

  resources :category do
    resources :restaurant, only: :index
  end

end
