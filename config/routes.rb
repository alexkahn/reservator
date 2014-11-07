Rails.application.routes.draw do
  root 'restaurant#index'
  resources :restaurant do
    resources :reservation
  end
  resources :reservation
end
