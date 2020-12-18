class BooksController < ApplicationController
    before_action :current_user

    def index
        if current_user
            @books = @current_user.books
        else
            redirect_to :root
        end
    
    end

    def show
        if logged_in?
          find_book
            if @book.nil?
                redirect_to user_books_path
            end
        else
            redirect_to :root 
        end
        
    end

    def new
        if current_user
            @book = Book.new
            @book.reviews.build
        else 
            redirect_to :root 
        end
    end

    def create
        @book = Book.new(book_params)
        if @book.valid?
            @book.save
            redirect_to user_books_path

        else 
            render :new
        end
  
    end

    def edit
        if current_user
          find_book    
        end
    end

    def update
      find_book
        if !@book.nil? && @book.valid?
            @book.update(book_params)
            redirect_to user_book_path(@book)
        else  
            render :edit 
        end
    end

    def destroy
        book = Book.find_by(id: params[:id])
        book.destroy
        redirect_to user_books_path
    end

    def not_read
        @books = @current_user.books.own.not_read
    end

    private

    def find_book
        @book = @current_user.books.find_by(id: params[:id])  
    end

    def book_params
        params.require(:book).permit(:title, :author, :read, :currently_own,
            reviews_attributes:[:title, :description, :user_id]
        )
    end

    def review_params
        params.require(:reviews).permit(:title, :description, :rating)
    end

end
