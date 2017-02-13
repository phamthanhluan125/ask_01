class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: :create
  prepend_before_filter :verify_signed_out_user, only: :destroy

  layout "main"

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    cookies.delete(:auth_token)
    reset_session
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end