Rails.application.routes.draw do
  resources :private_messages
  resources :rooms
  resources :messages
  get 'sessions/new'
  get 'static_pages/home'
  root 'static_pages#home'
    get '/signup', to: 'users#new'    
  resources :users, except: [:new]  
   get    '/login',  to: 'sessions#new'    
  post   '/login',  to: 'sessions#create'    
  get    '/logout', to: 'sessions#destroy' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
