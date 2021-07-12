class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @User = current_user
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(book.id)
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end