class ApplicationController < ActionController::Base
  before_action :settleSabors
  before_action :settleAdm
  before_action :settleEntregador
  before_action :settleLoja

  
  def settleSabors
    unless Sabor.all.any?
      sabor1 = Sabor.new(descricao: 'Calabresa', preco: 20.5)
      sabor1.save
      sabor2 = Sabor.new(descricao: 'Quatro Queijos', preco: 20.5)
      sabor2.save
      sabor3 = Sabor.new(descricao: 'Peperone', preco: 18.80)
      sabor3.save
      sabor4 = Sabor.new(descricao: 'Bacon', preco: 22.50)
      sabor4.save
      sabor5 = Sabor.new(descricao: 'Frango com Cheddar', preco: 21.30)
      sabor5.save
    end
  end

  def settleAdm
    check_adm = User.find_by(email: 'adm@adm', cpf: "12345678978")
    if check_adm.nil?
      adm = User.new(email: "adm@adm",cpf: "12345678978", password: "123456", password_confirmation: "123456", nome: "adm", telefone: "87996202910", adm: true)
      adm.save
    end
  end

  def settleEntregador
    unless Entregador.all.any?
      entregador = Entregador.new(nome: "João", cpf: "98765415921", telefone: "87911999999")
      entregador.save
    end
  end

  def settleLoja
    unless Loja.all.any?
      loja = Loja.new abertura: "00:00", fechamento: "23:59"
      loja.save
    end
  end
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