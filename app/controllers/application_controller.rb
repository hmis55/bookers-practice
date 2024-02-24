class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

# sign inしたときの遷移先
  def after_new_user_session_for(resource)
    books_path
  end
# log in したときの遷移先
  def after_new_user_registration_for(resource)
    books_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
