class HomeController < ApplicationController

    def index
        @loja = Loja.first
    end

end