class HomeController < ApplicationController
  before_action :settleSabors
  before_action :settleAdm
  before_action :settleEntregador
  def index
  end

  def settleSabors
    if !Sabor.all.any?
      sabor1 = Sabor.new(nome: 'Calabresa', preco: 20.5)
      sabor1.save
      sabor2 = Sabor.new(nome: 'Quatro Queijos', preco: 20.5)
      sabor2.save
      sabor3 = Sabor.new(nome: 'Peperone', preco: 18.80)
      sabor3.save
      sabor4 = Sabor.new(nome: 'Bacon', preco: 22.50)
      sabor4.save
      sabor4 = Sabor.new(nome: 'Frango com Cheddar', preco: 21.30)
      sabor4.save
    end
  end
  def settleAdm
    check_adm = User.find_by(email: 'adm@adm', cpf: "12345678978")
    if check_adm == nil
      adm = User.new(email: "adm@adm",cpf: "12345678978", password: "123456", password_confirmation: "123456", nome: "adm", telefone: "87996202910", adm: true)
      adm.save
    end
  end
  def settleEntregador
    if !Entregador.all.any?
      deliverBoy = Entregador.new(nome: "João", cpf: "98765415921", telefone: "87911999999")
      deliverBoy.save
    end
  end

end