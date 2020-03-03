Rails.application.routes.draw do
  
  root 'sessions#welcome'

  resources :users, only: [:new, :create]
  
  get 'signup', to: 'users#new', as: 'signup'

  resources :sessions, only: [:new, :edit, :create, :destroy]

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'welcome', to: 'sessions#welcome'
  get '/', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  resources :contacts, only: [:create]
  resources :talent_profiles, only: [:show, :new, :create, :update]
  
  get 'explore', to: 'talent_profiles#index'
end
