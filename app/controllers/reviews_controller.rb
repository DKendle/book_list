class ReviewsController < ApplicationController

    def index

    end

    def show
        @review = Review.find_by(id: params[:id])
        @review.user = User.find_by(id: session[:user_id])
    end

    def new
        @user = User.find_by(id: session[:user_id])
        @review = Review.new
    end

    def create
        @user = User.find_by(id: session[:user_id])
        @review = Review.new(review_params)
        @review.user = @user
        if @review.valid?
            @review.save
            redirect_to user_path(@review)
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

    def review_params
        params.require(:review).permit(:title, :description, :rating, :user_id, :book_id)
    end
end
