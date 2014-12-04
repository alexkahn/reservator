Rails.application.routes.draw do
  
  concern :reservable do |options|
    resources :reservation, options
  end
  
  concern :starable do |options|
    resources :star, options
  end
  
  devise_for :users

  root 'restaurant#index'
  
  resources :restaurant do
    concerns :reservable
    concerns :starable, only: [:create, :destroy]
  end
  
  resources :reservation

  get '/owner', to: 'restaurant#dashboard'

  resources :star, only: :index 

  resources :category do
    resources :restaurant, only: :index
  end

end