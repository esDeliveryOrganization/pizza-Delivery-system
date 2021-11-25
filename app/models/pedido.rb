class Pedido < ApplicationRecord
  belongs_to :pizza
  belongs_to :endereco
  belongs_to :entregador
end
