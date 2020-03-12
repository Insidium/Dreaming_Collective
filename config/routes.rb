Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #Home Page
  root to: "users#index"
  get "/", to: "users#index", as: "home"

  #About Page
  get "/about", to: "users#about", as: "about"

  #Donate Page
  get "/donate", to: "users#donate", as: "donate"

  #User Dashboard
  get "/dashboard/:id", to: "users#dash", as: "dashboard"

  #Create new artwork item
  get "/items/new", to: "items#new", as: "new_item"
  post "/items", to: "items#create"
  #Show all art
  get "/items/all", to: "items#index", as: "all_items"
  #Show individual piece of art
  get "/items/:id", to: "items#show", as: "item"
  # Remove item listing
  delete "/items/:id", to: "items#destroy"

  #New Artist
  get "/artists/new", to: "artists#new", as: "new_artist"
  post "/artists", to: "artists#create"

  #Artist Profile
  get "/artists/:id/edit", to:"artists#edit", as: "edit_artist"
  put "/artists/:id", to: "artists#update"
  patch "/artists/:id", to: "artists#update"

  #Show Artists
  get "/artists/all", to: "artists#index", as: "all_artists"
  # Show individual Artist
  get "/artists/:id", to: "artists#show", as: "artist"

  #New Order
  get "/orders/new", to: "orders#new", as: "new_order"
  #Order complete
  get "/orders/complete", to: "orders#complete"
  #Order Webhook
  post "/orders/webhook", to: "orders#webhook"


end