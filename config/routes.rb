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
  #resources :shoes
  resources :designers



  #get '/shoes/search' => 'shoes#search'
  #post '/shoes/index' => 'shoes#index'

  resources :shoes do
    collection do
      get :search #this creates a new path for the search input
      post :search
   end
  end
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  #nested routes 
  resources :designers do
    resources :reviews, only: [:new, :index]
  end

  resources :users

 
end

