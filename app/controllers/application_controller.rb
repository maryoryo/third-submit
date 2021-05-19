class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!,except: [:top, :about]
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :set_current_user
  # @current_user=User.find_by(id: session[:user_id])
  
  # before_action :forbid_login_user, {only: [:name, :create, :login_form, :login]}


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
  # def autheniticate_user
  #   if @current_user==nil
  #     flash[:notice]="ログインが必要です"
  #     redirect_to new_user_session
  #   end
  # end
  
  # def set_current_user
  #   @current_user=User.find_by(id :session[:user_id])
  # end
  
  # def fobid_login_user
  #   if @current_user
  #     flash[:notice]="ログインしています"
  #     redirect_to book_path
  #   end
  # end
  
end
