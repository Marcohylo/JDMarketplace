Rails.application.routes.draw do
  root 'listings#index'
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  
<<<<<<< Updated upstream
  get "/listings", to: "listings#index", as: "listings"
  post "/listings", to: "listings#create"
  get "/listings/new", to: "listings#new", as: "new_listing"
  get "/listings/:id", to: "listings#show", as: "listing"
  put "/listings/:id", to: "listings#update"
  patch "/listings/:id", to: "listings#update"
  delete "/listings/:id", to: "listings#destroy"
  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"
=======
  resources :listings
  
  post "/listings", to: "listings#new"
  put "/listings/:id", to: "listings#update"
  patch "/listings/:id", to: "listings#update"
  delete "/listings/:id", to: "listings#destroy"
 
>>>>>>> Stashed changes

  get "*path", to: "pages#not_found"
end
