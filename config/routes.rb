Rails.application.routes.draw do
  root 'restaurant#index'
  resources :restaurant
end
