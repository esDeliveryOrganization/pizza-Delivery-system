class Pedido < ApplicationRecord 
  has_one :pizza , dependent: :destroy
  accepts_nested_attributes_for :pizza, allow_destroy: true, reject_if: :all_blank

  belongs_to :endereco
  belongs_to :entregador

  validates_associated :pizza
  validates_presence_of :pizza, :message => "Preencha os campos de pizza"

  validates :endereco_id, presence: true
  validates :entregador_id, presence: true
  validates :quantidadePizzas, presence: true
  validates :contato, presence: true, numericality: { only_integer: true },  length: {is: 11}
  validates :observacao, length: { maximum: 40, too_long: "must have at maximum 40 characters" }
  validates :nomeDestinatario, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
