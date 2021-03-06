# frozen_string_literal: des

class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, :only => []
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]


  def sign_up(resource_name, resource)
    if current_user.nil?
      sign_in(resource_name, resource)
    end
  end

  # GET /resource/sign_up
  def new
    super
  end


  # POST /resource
  #def create
  # User.create!({:nome => params[:nome], :cpf => params[:cpf], :telefone => params[:telefone], :password => params[:password], :email => params[:email], :password_confirmation => params[:password_confirmation]})
  #end

  # GET /resource/edit
  # def edit
  #   super
  # end


  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  def deleteOtherUser
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_path, notice: "Usuario Destruido" }
      format.json { head :no_content }
    end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:adm])

  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def update
    # code here
  end
end
