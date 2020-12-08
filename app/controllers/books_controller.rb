class BooksController < ApplicationController

    def index
        if logged_in?
            @user = User.find_by(id: session[:user_id])
            @books = @user.books
        else
            redirect_to :root
        end
    
    end

    def show
        if logged_in?
            @user = User.find_by(id: session[:user_id])
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
            @user = User.find_by(id: session[:user_id])
            @book = Book.new
            #@book.reviews.build
            #have to tell the form to expect an empty reviews model to build
        else 
            redirect_to :root 
        end
        #@review = @book.reviews.build
    end

    def create
        user = User.find_by(id: session[:user_id])
        book = Book.new(book_params)
        if book.valid?
            book.save
            user.books << book
            #review = book.reviews.create(review_params)
            redirect_to user_books_path

        else 
            render :new
        end
  
    end

    def edit
        if logged_in?
            @user = User.find_by(id: session[:user_id])
            @book = @user.books.find_by(id: params[:id])    
        end
    end

    def update
        @user = User.find_by(id: session[:user_id])
        @book = @user.books.find_by(id: params[:id])
        if !@book.nil? && @book.valid?
            @book.update(book_params)
            redirect_to user_books_path(@book)
        else  
            render :edit 
        end
    end

    def destroy
        book = Book.find_by(id: params[:id])
        book.destroy
        redirect_to user_books_path
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :read, :currently_own, 
            reviews_attributes:[:title, :description]
        )
    end

    def review_params
        params.require(:reviews).permit(:title, :description, :rating)
    end
end
