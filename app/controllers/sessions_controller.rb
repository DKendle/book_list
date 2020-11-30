class SessionsController < ApplicationController

    def new
        @user = User.new
    end


    #will will log a user in
    def create
        @user = User.find_by(name: params[:name], password_digest: params[:password])
    end

    #will end a user's session by clearing a session value
    def destroy
    end
end