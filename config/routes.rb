Rails.application.routes.draw do
  root "welcome#home"
  
  resources :books do
    resources :reviews, only: [:show, :index, :new]
  end

  ####Review CRUD functions that are not nested are deactivated.

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
