class AddSabor2IdToPizzas < ActiveRecord::Migration[6.1]
  def change
    add_column :pizzas, :sabor2_id, :integer
    add_index :pizzas, :sabor2_id
  end
end
