Rails.application.routes.draw do
  root "welcome#home"
  
  resources :books do
    resources :reviews, only: [:show, :index, :new]
  end

  ####Review CRUD functions that are not nested are deactivated.

  resources :users, reject: [:index] do 
    resources :books
  end

end
