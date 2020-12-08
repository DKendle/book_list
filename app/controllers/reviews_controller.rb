class ReviewsController < ApplicationController

    def index
        if logged_in?
            @user = User.find_by(id: session[:user_id])
            @reviews = @user.reviews
        else
            redirect_to :root 
        end
    end

    def show
        if logged_in?
            @user = User.find_by(id: session[:user_id])
            @review = @user.reviews.find_by(id: params[:id])

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
        byebug
        if !@review.nil?
            @review.update(review_params)
            redirect_to user_reviews_path(@review)
        else
            render :edit
        end
    end

    def destroy
        @user = User.find_by(id: session[:user_id])
        @review = @user.reviews.find_by(id: params[:review_id])
        @review.destroy
        redirect_to user_reviews_path(@review)
    end

    private

    def review_params
        params.require(:review).permit(:title, :description, :rating, :user_id, :book_id)
    end
end
