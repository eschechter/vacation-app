Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #User routes
  get "/signup", to: "users#new"
  get "/", to: "users#homepage", as: "home"
  resources :users, only: [:show, :create]

  #Session routes

  get "/login", to: "sessions#new", as: "login"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy", as: "logout"

  #Vacation routes

  resources :vacations, only: [:index, :show]
end
