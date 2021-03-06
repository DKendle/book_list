class ApplicationController < ActionController::Base


    def logged_in?
        session[:user_id].present?
     end
     
     def current_user
        @current_user ||= User.find_by(id: session[:user_id])
      end

    def find_user
        @user = User.find_by(id: session[:user_id])
    end
end
