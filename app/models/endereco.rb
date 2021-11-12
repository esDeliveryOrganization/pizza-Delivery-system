class Endereco < ApplicationRecord
  has_one :user

  validates :cep, presence: true, numericality: { only_integer: true }, length: {is: 8}
  validates :cidade, presence: true, length: {minimum: 4, too_short: "Must have at least 4 characters!"}
  validates :bairro, presence: true, length: {minimum: 4, too_short: "Must have at least 4 characters!"}
  validates :logradouro, presence: true, length: {minimum: 4, too_short: "Must have at least 4 characters!"}
  validates :complemento, length: {maximum:50, too_long: "Must have at maximum 50 characters!"}

end
