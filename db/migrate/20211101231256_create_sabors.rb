class CreateSabors < ActiveRecord::Migration[6.1]
  def change
    create_table :sabors do |t|
      t.string :descricao
      t.float :preco

      t.timestamps
    end
  end
end
