class ApplicationController < ActionController::Base

  protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:nome])
     devise_parameter_sanitizer.permit(:sign_up, keys: [:cpf])
     devise_parameter_sanitizer.permit(:sign_up, keys: [:telefone])
     devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
     devise_parameter_sanitizer.permit(:sign_up, keys: [:adm])
   end

   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:nome])
     devise_parameter_sanitizer.permit(:account_update, keys: [:cpf])
     devise_parameter_sanitizer.permit(:account_update, keys: [:telefone])
     devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
     devise_parameter_sanitizer.permit(:account_update, keys: [:adm])
   end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:cpf])
  end

end
