class ApplicationController < ActionController::Base

    def current_user?
        #Check current session[:id] matches 
        session[:id] = @user.id
    end

    def logged_in?
        #Checks whether user is logged in or not
        if !session[:id].nil?
        end
    end
end
