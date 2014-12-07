Rails.application.routes.draw do

  devise_for :users

  root 'home#index'

  resources :restaurants do
    resources :reservations
    member do
      resources :stars, only: [:create, :destroy]
    end
  end

  resources :reservations

  get '/owner', to: 'home#owner_dashboard'
  get '/patron', to: 'home#patron_dashboard'

  resources :stars, only: :index

  resources :categories do
    resources :restaurants, only: :index
  end

end
