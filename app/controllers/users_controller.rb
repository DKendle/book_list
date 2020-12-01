class UsersController < ApplicationController
    #before_action :logged_in, only: [:show, :create, :edit, :update, :destroy]

   

    def show
        @user = User.find(params[:id])

    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
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
