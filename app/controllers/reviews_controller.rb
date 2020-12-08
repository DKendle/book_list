class ReviewsController < ApplicationController

    def index
        @user = User.find_by(id: session[:user_id])
        @reviews = @user.reviews
    end

    def show
        if logged_in?
            @user = User.find_by(id: session[:user_id])
            @review = @user.reviews.find_by(id: params[:id])
            @book = Book.find_by(id: @review.book_id)
        else 
            redirect_to :root 
        end
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
            redirect_to user_reviews_path(@review)
        else
            render :new
        end
    end

    def edit
        if logged_in?
            @user = User.find_by(id: session[:user_id])
            @review = @user.reviews.find_by(id: params[:id])
        else
            redirect_to :root 
        end
    
            
    end

    def update
        @user = User.find_by(id: session[:user_id])
        @review = @user.reviews.find_by(id: params[:id])
        if !@review.nil? && @review.valid?
            @review.update(review_params)
            redirect_to user_review_path(@review)
        else
            render :edit
        end
        byebug
    end

    def destroy
        @user = User.find_by(id: session[:user_id])
        @review = @user.reviews.find_by(id: params[:id])
        @review.destroy
        redirect_to user_reviews_path(@user)
    end

    private

    def review_params
        params.require(:review).permit(:title, :description, :rating, :user_id, :book_id)
    end
end
