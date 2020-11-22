class ApplicationController < ActionController::Base
helper_method :logged_in?
helper_method :current_user?


    def current_user?
        #Check current session[:id] matches 
        logged_in?
        session[:id] == @user.id
    end

    def logged_in?
        #Checks whether user is logged in or not
        if !session[:id].nil?
        end
    end
end
