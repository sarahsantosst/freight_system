class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin])
  end

  def is_admin?
    if !current_user.admin?
      redirect_to root_path, alert: 'Página restrita, somente administradores'
    end
  end
  
end
