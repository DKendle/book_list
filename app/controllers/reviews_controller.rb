class ReviewsController < ApplicationController
    before_action :current_user

    def index
        @reviews = @current_user.reviews
    end

    def show
        if current_user 
            find_review
            @book = Book.find_by(id: @review.book_id)
        else 
            redirect_to :root 
        end
    end

    def new
        if current_user
            @review = Review.new
        else
            redirect_to :root 
        end
    end

    def create
        @review = Review.new(review_params)
        @review.user = @current_user
        if @review.valid?
            @review.save
            redirect_to user_book_path(@review.user_id, @review.book)
        else
            flash.now[:alert] = "Please Select a Book to Review"
            render :new
        end
    end

    def edit
        if current_user
            find_review
        else
            redirect_to :root 
        end
    
    end

    def update
        find_review
        if !@review.nil? && @review.valid?
            @review.update(review_params)
            redirect_to user_review_path(@review)
        else
            render :edit
        end
    end

    def destroy
        find_review
        @review.destroy
        redirect_to user_reviews_path(@current_user)
    end

    private

    def find_review
        @review = @current_user.reviews.find_by(id: params[:id])
    end

    def review_params
        params.require(:review).permit(:title, :description, :rating, :user_id, :book_id)
    end
end
