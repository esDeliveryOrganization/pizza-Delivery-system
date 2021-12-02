class Sabor < ApplicationRecord
  validates :descricaoSabor, presence: true, uniqueness: true, length: {minimum: 3, too_short: "Must have at least 3 characters!"}
  validates :preco, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0}
end
