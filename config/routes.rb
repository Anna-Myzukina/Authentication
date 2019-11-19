Rails.application.routes.draw do
  root 'static_pages#home'

  get 'static_pages/logIn'

  get 'users/new'

  resources :users
  get   '/home',     to: 'users#index'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
