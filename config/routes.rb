Rails.application.routes.draw do
  devise_for :users
  root 'restaurant#index'
  resources :restaurant do
    resources :reservation
  end
  resources :reservation
end
