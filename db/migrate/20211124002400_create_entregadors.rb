class CreateEntregadors < ActiveRecord::Migration[6.1]
  def change
    create_table :entregadors do |t|
      t.string :nome
      t.string :telefone
      t.string :cpf

      t.timestamps
    end
  end
end
