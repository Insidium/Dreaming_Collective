class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    # Devise sanitizing for users
    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address])
      end

      # Redirect to dashboard on login success
      def after_sign_in_path_for(resource)
        dashboard_path(current_user.id)
      end
end
