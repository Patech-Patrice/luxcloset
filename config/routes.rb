Rails.application.routes.draw do

   root 'sessions#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'


  delete '/logout' => 'sessions#destroy'

  resources :handbags
  resources :shoes

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :designers

  resources :reviews

  resources :users
end

