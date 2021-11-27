class Pizza < ApplicationRecord
    belongs_to :pedido
    has_many :sabor

    validate :checarSabores
    validates :tamanho, presence: true

    def checarSabores
        if sabor1_id == nil && sabor2_id == nil
            errors.add(:sabor1_id, "Preencha ao menos um campo de sabor")
            errors.add(:sabor2_id, "Preencha ao menos um campo de sabor")
        end
    end     

end
