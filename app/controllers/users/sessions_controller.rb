class Users::SessionsController < Devise::SessionsController
  # Skip other Devise actions if needed
  skip_before_action :verify_authenticity_token, only: [:create]

  # Override the create method to handle login-specific errors
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    respond_with resource, location: after_sign_in_path_for(resource)
  rescue StandardError => e
    flash[:alert] = "Invalid email or password"
    render :new
  end

  # Ensure proper redirection after successful sign in
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

  # Ensure the correct parameters are permitted
  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
