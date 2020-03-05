Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #Home Page
  root to: "users#index"
  get "/", to: "users#index", as: "home"

  #Create new artwork item
  get "/items/new", to: "items#new", as: "new_art"
  post "/items", to: "items#create"

  #Show individual piece of art
  get "/items/:id", to: "items#show", as: "item"

  #Show Artists
  get "/artists", to: "artists#index", as: "artists"

  # Show individual Author
  get "/artists/:id", to: "artists#show", as: "artist"

end