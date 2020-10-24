class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:edit, keys: [:photo])
    devise_parameter_sanitizer.permit(:update, keys: [:photo])
    devise_parameter_sanitizer.permit(:new, keys: [:photo])
    devise_parameter_sanitizer.permit(:create, keys: [:photo])
  end
end
