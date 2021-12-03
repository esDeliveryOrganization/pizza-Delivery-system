class Pizza < ApplicationRecord
    belongs_to :pedido
    has_many :sabor

    # validate :checarSabores
    validates :tamanho, presence: true
    validates :sabor1_id, presence: true
    validates :sabor2_id, presence: true
    validates :desc, length: { maximum: 40, too_long: "must have at maximum 40 characters" }
end
