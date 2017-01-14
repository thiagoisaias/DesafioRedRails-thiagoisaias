class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Redirect after sign in
  def after_sign_in_path_for(resource_or_scope)
    feed_path
  end
  
  protected
  # Sanitizing inputs for sign up and account_update to add a :name field
  # Add custom field to Devise model (name)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
