class UsersController < ApplicationController
    before_action :current_user?, only: [:edit, :update, :destroy]

    def new
        @user = User.new
        @user.books.build
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, 
            books_attributes: [
                :title,
                :author,
                :read,
                :currently_own
            ]
        )
    end
end
