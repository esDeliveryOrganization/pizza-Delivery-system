class Entregador < ApplicationRecord
  has_many :pedidos
  validates :cpf, length: {is: 11}, presence: true, uniqueness: true,numericality: { only_integer: true }
  validates :nome, presence: true, length: {minimum: 3, too_short: "must have at least 3 characters", maximum: 30, too_long: "must have at maximum 30 characters" }
  validates :telefone, presence: true, numericality: { only_integer: true }, length: {minimum: 11, too_short: "must have at least numbers 11"}
end
