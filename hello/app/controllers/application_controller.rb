class ApplicationController < ActionController::Base
  
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  protected

  def json_request?
    request.format.json?
  end

  before_action :update_sanitized_params, if: :devise_controller?
  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :name])
  end



end
