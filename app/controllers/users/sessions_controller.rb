# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    @user = User.where(cpf: params[:cpf]).first
    if @user.confirmed? and @user.authenticate(params[:password])
      session[:user_id] = @user.user_id
      redirect_to root_path      
    else
      flash[:error] = "Invalid Cpf or password"
      render :new
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  #  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:cpf])
  end
end
