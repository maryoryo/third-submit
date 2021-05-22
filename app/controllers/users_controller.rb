class UsersController < ApplicationController
  
   before_action :ensure_current_user, only: [:edit, :update] 
  
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
    # @users = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @users = @book.user
  end

  def edit
    @user = User.find(params[:id])
    if @user!=current_user
      redirect_to books_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  protected
    
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def ensure_current_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end
  
  
end
