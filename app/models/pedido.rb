class Pedido < ApplicationRecord 
  has_one :pizza , dependent: :destroy
  accepts_nested_attributes_for :pizza, allow_destroy: true, reject_if: :all_blank

  belongs_to :endereco
  has_one :entregador

  validates_associated :pizza
  validates_presence_of :pizza, :message => "Preencha os campos de pizza"

end
