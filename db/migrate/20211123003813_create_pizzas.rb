class CreatePizzas < ActiveRecord::Migration[6.1]
  def change
    create_table :pizzas do |t|
      t.float :tamanho
      t.integer :fatias
      t.float :preco
      t.text :desc

      t.timestamps
    end
  end
end
