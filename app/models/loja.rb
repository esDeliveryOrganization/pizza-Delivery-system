class Loja < ApplicationRecord
  validate :validarFuncionamento
  validates :abertura, presence: true
  validates :fechamento, presence: true

  def validarFuncionamento
    if !fechamento.nil? && !abertura.nil?
      if fechamento < abertura
        errors.add(:fechamento, "Hora de fechamento não pode ser antes da hora de abertura!")
      end
    end
  end
end