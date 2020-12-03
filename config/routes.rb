Rails.application.routes.draw do
  root "welcome#home"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  get "/signup", to: "users#new"
  
  resources :users, only: [:new, :create, :edit, :update, :destroy]
####Review CRUD functions that are not nested are deactivated.

  resources :users, only: [:show] do 
    resources :books
  end

  resources :books, only: [:show] do
    resources :reviews, only: [:show, :index, :new, :create]
  end

  
end
