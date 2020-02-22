Rails.application.routes.draw do
  
  resources :talent_profiles
  root 'sessions#welcome'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get '/', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

end
