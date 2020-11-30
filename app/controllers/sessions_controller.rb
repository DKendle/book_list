class SessionsController < ApplicationController

    def new
        @user = User.new
    end


    #will will log a user in
    def create
        user = User.find_by(name: params[:name])
        if user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        
        else
           redirect_to :login
           
        end
 
    end

    #will end a user's session by clearing a session value
    def destroy
    end
end