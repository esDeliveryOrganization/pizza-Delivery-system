class CardapioController < ApplicationController

  def index
    @sabors = Sabor.all
  end

end
