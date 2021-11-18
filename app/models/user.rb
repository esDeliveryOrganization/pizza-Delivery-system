class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :enderecos, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:cpf]

  validates :cpf, length: {is: 11}, presence: true, uniqueness: true,numericality: { only_integer: true }
  validates :nome, presence: true, length: {minimum: 3, too_short: "must have at least 3 characters "}, length: { maximum: 30, too_long: "must have at maximum 30 characters" }
  validates :telefone, presence: true, numericality: { only_integer: true }, length: {minimum: 11, too_short: "must have at least numbers 11"}
  validates :password_confirmation, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  
end
