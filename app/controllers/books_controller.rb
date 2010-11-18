class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(params[:book])
     
    if @book.save
       redirect_to books_path #@book
    else
      render :action => "new"
    end
   
  end

  def new
    @book = Book.new
  end

  def search
  end

end
