class UsersController < ApplicationController
    before_action :current_user?, only: [:edit, :update, :destroy]

   

    def show
        @user = User.find(params[:id])

    end

    def new
        @user = User.new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        if user.present?
            redirect_to :root
            #add message "That username already exists...try something else or Login"
        elsif
            user = User.new(user_params)
            user.save if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            render :new 
        end

    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
