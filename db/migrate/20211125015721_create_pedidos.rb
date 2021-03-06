class CreatePedidos < ActiveRecord::Migration[6.1]
  def change
    create_table :pedidos do |t|
      t.belongs_to :endereco, null: false, foreign_key: true
      t.belongs_to :entregador, null: false, foreign_key: true
      t.float :precoTotal
      t.string :status
      t.integer :quantidadePizzas
      t.text :observacao
      t.string :nomeDestinatario
      t.string :contato

      t.timestamps
    end
  end
end
