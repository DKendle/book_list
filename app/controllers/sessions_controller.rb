class SessionsController < ApplicationController

    def new
    end


    #will log a user in
    def create
        user = User.find_by(name: params[:name])
        if !user.nil? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
           redirect_to :login
           #add flash message that says something went wrong
           #try again
        end
    end

    #will end a user's session by clearing a session value
    def destroy
        session.delete :user_id
        redirect_to :root

    end
end