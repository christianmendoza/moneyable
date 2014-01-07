class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    user_accounts_path(user)
  end

  # protected

  # def configure_devise_permitted_parameters
  #   registration_params = [:first_name, :last_name, :email, :password, :password_confirmation]

  #   if params[:action] == 'update'
  #     devise_parameter_sanitizer.for(:account_update) { 
  #       |u| u.permit(registration_params << :current_password)
  #     }
  #   elsif params[:action] == 'create'
  #     devise_parameter_sanitizer.for(:sign_up) { 
  #       |u| u.permit(registration_params) 
  #     }
  #   end
  # end

  # def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
  # end
end
