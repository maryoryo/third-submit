class BooksController < ApplicationController
 
 
 before_action :ensure_current_user, only: [:edit, :update] 
  
 
  def index
    @user = current_user
    # @profile_images = current_user
    @users = User.all
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
      @books = Book.all
      @user = @book.user
      render :index
      
    end
  end

  
  def show
    @bookes = Book.find(params[:id])
    @book = Book.new
    @user = current_user
    @users = @book.user
    @books = Book.all
    
    
    #@user = User.find(params[:id])
    #@books = @user.books
    #@book = Book.new
    
    
    
    
    
    
    
  end

  def edit
    @books = Book.find(params[:id])
    # if @books != current_user
      # redirect_to 
    # end
  end
  
  def update
    @books = Book.find(params[:id])
    if @books.update(books_params)
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
  
  def ensure_current_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end
