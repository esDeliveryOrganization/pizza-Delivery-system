class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, :only => []
  prepend_before_action :authenticate_scope!
    
    protected 
  
    def sign_up(resource_name, resource)
      if current_user == nil
        sign_in(resource_name, resource)
      end
    end
    # helper_method :sign_up
end