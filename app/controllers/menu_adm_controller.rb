class MenuAdmController < ApplicationController

    def index
        @loja = Loja.first
    end
    
    def getClientes
        @clientes = User.where(adm: nil)
    end

    def getAdms
        @adms = User.where(adm: true)
    end

end
