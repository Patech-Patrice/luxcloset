Rails.application.routes.draw do

  root 'sessions#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'


  delete '/logout' => 'sessions#destroy'


  #get '/auth/google_oauth2/callback' => 'sessions#omniauth'
  #This route makes it dynamic so a user can connect to multiple providers
  get '/auth/:provider/callback' => 'sessions#create'

  resources :reviews
  resources :handbags
  resources :shoes
  resources :designers

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :designers do
    resources :reviews, only: [:new, :index]
   end




  resources :users
end

