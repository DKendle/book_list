class BooksController < ApplicationController

    def index
    end

    def show
        @book
    end

    def new
        @book = Book.new
        @book.reviews.build
    end

    def create
        book = Book.new(book_params)
        if book.valid?
            book.save
            redirect_to book_path(book)
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

    def book_params
        params.require(:book).permits(:title, :author, :read, :currently_own, 
            reviews_attributes: [
                :title,
                :description,
                :rating,
                :user_id
            ]
        )
    end
end
