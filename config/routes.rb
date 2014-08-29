Rails.application.routes.draw do
  root to: 'photos#index'

  resources :users
  resources :photos
  resources :tags, only: [:new, :create]
end
