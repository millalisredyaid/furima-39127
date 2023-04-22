class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :position, :occupation])
  end
  #before_action :basic_auth

  #private

  #def basic_auth
    #authenticate_or_request_with_http_basic do |username, password|
      #username == 'admin' && password == '0120' 
    #end
  #end
  
end