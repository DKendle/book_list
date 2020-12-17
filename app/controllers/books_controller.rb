class BooksController < ApplicationController
    before_action :find_user, except: [:destroy]

    def index
        if logged_in?
            @books = @user.books
        else
            redirect_to :root
        end
    
    end

    def show
        if logged_in?

            @book = @user.books.find_by(id: params[:id])
            if @book.nil?
                redirect_to user_books_path
            end
        else
            redirect_to :root 
        end
        
    end

    def new
        if logged_in?

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
            #review = book.reviews.create(review_params)
            redirect_to user_books_path

        else 
            render :new
        end
  
    end

    def edit
        if logged_in?

            @book = @user.books.find_by(id: params[:id])    
        end
    end

    def update
        @book = @user.books.find_by(id: params[:id])
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
        @user = User.find_by(id: session[:user_id])
        @books = @user.books.not_read
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :read, :currently_own,
            reviews_attributes:[:title, :description, :user_id]
        )
    end

    def review_params
        params.require(:reviews).permit(:title, :description, :rating)
    end

end
