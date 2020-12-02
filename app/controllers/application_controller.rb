class ApplicationController < ActionController::Base

    def logged_in?
        session[:user_id].present?
     end
     
    def current_user?
       session[:user_id] == @user.id
    end

    
end
