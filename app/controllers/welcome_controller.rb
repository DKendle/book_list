class WelcomeController < ApplicationController

def home

   if logged_in?
    user = User.find_by(id: session[:user_id])
        redirect_to user_path(user)
   end
end

end