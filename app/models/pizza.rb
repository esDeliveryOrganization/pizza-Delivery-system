class Pizza < ApplicationRecord
    belongs_to :pedido
    has_many :sabor

    # validate :checarSabores
    validates :tamanho, presence: true

end
