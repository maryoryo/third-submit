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
    if @book.save
      flash[:notice] = "You have created book successfully." 
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  
  def show
    @book = Book.find(params[:id]) 
    @user = @book.user
    @books = Book.all
  end

  def edit
    @books = Book.find(params[:id])
  end
  
  def update
    @books = Book.find(params[:id])
    if  @books.update(books_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@books.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  
  
  private
    
  def books_params
    params.require(:book).permit(:title, :body)
  end
  
end
