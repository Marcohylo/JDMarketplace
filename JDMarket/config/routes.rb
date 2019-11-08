Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :line_items
  resources :carts
  resources :listings
 
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  #  root 'listings#index'
  root 'pages#index'
  get '/order', to: 'listings#order'

  post '/listings', to: 'listings#create'

  # get "/listings", to: "listings#index", as: "listings"
  # post "/listings", to: "listings#create"
  # get "/listings/new", to: "listings#new", as: "new_listing"
  # get "/listings/:id", to: "listings#show", as: "listing"
  # put "/listings/:id", to: "listings#update"
  # patch "/listings/:id", to: "listings#update"
  # delete "/listings/:id", to: "listings#destroy"
  # get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"

  get "*path", to: "pages#not_found"
end
