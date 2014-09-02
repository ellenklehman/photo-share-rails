Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'users#new'

  resources :users
  resources :photos
  resources :tags, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
