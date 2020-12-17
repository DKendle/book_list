Rails.application.routes.draw do
  root "welcome#home"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/auth/google_oauth2/callback", to: "sessions#google_login"

  post "/logout", to: "sessions#destroy"

  get "/signup", to: "users#new"
  #
  get "/not-read", to: "books#not_read"
  #
  resources :users, only: [:new, :create, :edit, :update, :destroy]

  resources :users, only: [:show] do 
    resources :books
  end

  resources :users, only: [:show] do
    resources :reviews
  end

  
  
end
