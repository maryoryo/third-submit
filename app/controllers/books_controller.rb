class BooksController < ApplicationController
 
  def index
    @user = current_user
    # @profile_images = current_user
    # @users = User.all     
    # (params[:id]).reverse_order
    @books = Book.all
    # @profile_image = User.all
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  
  def show
    @book = Book.find(params[:id]) 
    @user = @book.user
    
  end

  def edit
    
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redilect_to books_path
  end
  
  
  
  private
    
  def books_params
    params.require(:book).permit(:title, :body)
  end
  
end
