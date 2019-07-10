Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # User routes
  get "/signup", to: "users#new"
  get "/", to: "users#homepage", as: "home"
  resources :users, only: [:show, :create]

  # Session routes

  get "/login", to: "sessions#new", as: "login"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy", as: "logout"

  # Flight route

  get "/flights/search/:id", to: "flights#search", as: "flight_search"

  # Vacation routes

  get "/vacations", to: "vacations#index", as: "vacations"
  get "/vacations/new", to: "vacations#new", as: "new_vacation"
  get "/vacations/:id", to: "vacations#show", as: "vacation"
  post "/vacations", to: "vacations#create"
  post "/vacations/finalize/:id", to: "vacations#finalize", as: "finalize_vacation"
  post "/vacations/:vacation_id/:flight_id", to: "vacations#add_flight"

  # VacationFlights routes

  resources :vacation_flights, only: [:create, :destroy]

  resources :hotel_stays, only: [:create, :destroy]
end
