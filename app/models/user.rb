class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :enderecos, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:cpf]

  validates :cpf, length: {is: 11}, presence: true, uniqueness: true,numericality: { only_integer: true }
  validates :nome, presence: true
  validates :telefone, presence: true, numericality: { only_integer: true }

end
