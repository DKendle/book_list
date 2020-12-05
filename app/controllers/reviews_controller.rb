class ReviewsController < ApplicationController

    def index

    end

    def show

    end

    def new

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

    def review_params
        params.require(:review).permit(:title, :description, :rating, :user_id, :book_id)
    end
end
