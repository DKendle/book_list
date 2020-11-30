Rails.application.routes.draw do
  root "welcome#home"
  
  resources :books do
    resources :reviews, only: [:show, :index, :new]
  end

####Review CRUD functions that are not nested are deactivated.
### Add in helper to destroy nested books when user deletes account.
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy] do 
    resources :books
  end

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

end
