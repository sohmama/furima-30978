class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def index
  end

  def new
    @user = current_user.id
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_furigana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_furigana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:date_of_birth])
  end
end
