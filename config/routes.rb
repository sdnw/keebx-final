Rails.application.routes.draw do
  
  resources :items, only: [:index, :create, :update, :destroy, :show]
  resources :users, only: [:index, :create]
  resources :sellers, only: [:index]

  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/my_items", to: "items#my_items"
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
