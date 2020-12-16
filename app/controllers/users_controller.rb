class UsersController < ApplicationController
    before_action :current_user, except: [:index]
   

    def show
        if !current_user.nil?
            @current_user.books.build
        else
            redirect_to :root
        end
    end

    def new
        if !@current_user.nil?
            redirect_to user_path(@current_user)
        else
            @user = User.new
        end
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
        if !@current_user.nil?
            @current_user = find_user
        else 
            redirect_to :root 
        end
        
    end

    def update
        @current_user.update(user_params)
        if @current_user.valid?
            @current_user.save
            redirect_to user_path(@current_user)
        else
            render :edit 
        end

    end
    
    def destroy
       @current_user.destroy 
       redirect_to :root
       flash.now[:notice] = "Profile successfully deleted"
    end

    private

    def user_params
        params.require(:user).permit(:username , :email, :password, :password_confirmation,
            books_attributes: [
                :title,
                :author,
                :read,
                :currently_own

            ]
        
        )
    end

   
end
