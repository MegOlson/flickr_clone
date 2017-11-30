class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    binding.pry
    redirect_to main_app.root_url, :alert => exception.message
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({roles: [] }, :email, :name, :password, :password_confirmation)
    end
  end

end
