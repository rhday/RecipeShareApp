Rails.application.routes.draw do

  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout route
  delete '/logout' => 'sessions#destroy'

  resources :categories
  #resources :comments
  resources :users do
    resources :posts, only: [:new, :create, :index] 
  end 
  resources :posts do
    resources :comments
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
