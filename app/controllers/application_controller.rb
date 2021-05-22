class ApplicationController < ActionController::Base

  before_action :authenticate_user!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :set_current_user
  # @current_user=User.find_by(id: session[:user_id])

  # before_action :forbid_login_user, {only: [:name, :create, :login_form, :login]}

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_inactive_sign_up_path_for(resource)
    user_path(current_user.id)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end



end
