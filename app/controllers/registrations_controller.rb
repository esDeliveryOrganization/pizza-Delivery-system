class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, :only => []
  prepend_before_action :authenticate_scope!
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
    
    protected 
  
    def sign_up(resource_name, resource)
      if current_user.nil?
        sign_in(resource_name, resource)
      end
    end
    # helper_method :sign_up

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nome])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:cpf])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:telefone])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:adm])

    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:nome])
      devise_parameter_sanitizer.permit(:account_update, keys: [:cpf])
      devise_parameter_sanitizer.permit(:account_update, keys: [:telefone])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email])
    end


end