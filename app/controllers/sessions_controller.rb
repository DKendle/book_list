class SessionsController < ApplicationController

    def new
        user = User.find_by(id: session[:user_id])
        if logged_in?
            redirect_to user_path(user)
        end
    end
    
    def create
        user = User.find_by(username: params[:username])
        if !user.nil? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
           redirect_to :login
        end

    end


    #will log a user in
    
    #will end a user's session by clearing a session value
    def destroy
        session.delete :user_id
        redirect_to :root

    end

    def google_login
        @user = User.find_or_create_by(email: auth['info']['email']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
        end

        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end