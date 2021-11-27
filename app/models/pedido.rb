class Pedido < ApplicationRecord 
  has_one :pizza , dependent: :destroy
  accepts_nested_attributes_for :pizza, allow_destroy: true, reject_if: :all_blank

  belongs_to :endereco
  belongs_to :entregador
end
