Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :microposts,          only: [:new, :create, :index] 
  root 'microposts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end