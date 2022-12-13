Rails.application.routes.draw do
  resources :rooms
  devise_for :users
  # root 'home#index'
  root 'rooms#index'
end
