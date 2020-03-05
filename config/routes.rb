Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #Home Page
  root to: "users#index"
  get "/", to: "users#index", as: "home"

  #User Dashboard
  get "/dashboard/:id", to: "users#dash", as: "dashboard"

  #Create new artwork item
  get "/items/new", to: "items#new", as: "new_item"
  post "/items", to: "items#create"
  #Show individual piece of art
  get "/items/:id", to: "items#show", as: "item"

  #New Artist
  get "/artists/new", to: "artists#new", as: "new_artist"
  post "/artists", to: "artists#create"
  #Show Artists
  get "/artists", to: "artists#index", as: "all_artists"
  # Show individual Artist
  get "/artists/:id", to: "artists#show", as: "artist"

  #Order complete
  get "/orders/complete", to: "orders#complete"
  #Order Webhook
  post "/orders/webhook", to: "orders#webhook"

end