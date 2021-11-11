class CreateEnderecos < ActiveRecord::Migration[6.1]
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.string :cidade
      t.text :logradouro
      t.text :complemento
      t.belongs_to :user

      t.timestamps
    end
  end
end
