Rails.application.routes.draw do
  resources :user_concerts
  resources :concerts
  resources :users
  post '/login', to:'auth#create'
  get '/profile', to: 'users#show'
end
