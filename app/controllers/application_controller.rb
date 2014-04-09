class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError do |exception|
      redirect_to root_url, alert: exception.message
    end

  before_filter :configure_permitted_parameters, if: :devise_controller?
    
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   protected
  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :name, :avatar, :avatar_cache, :current_password, :image) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :name, :avatar, :avatar_cache, :current_password, :image) }
end 
end
