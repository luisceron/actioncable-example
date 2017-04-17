Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  root "home#index"

  resources :chatrooms
  resources :messages, only: :create

  get '/signup', to: "registrations#new"
  post '/signup', to: "registrations#create"

  get 'login', to: "sessions#new"
  post '/login', to: "sessions#create" 
  delete '/logout', to: "sessions#destroy"

  get 'users/:id', to: "users#show", as: "profile"

end
