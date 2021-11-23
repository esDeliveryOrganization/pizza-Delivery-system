class AddSabor1IdToPizzas < ActiveRecord::Migration[6.1]
  def change
    add_column :pizzas, :sabor1_id, :integer
    add_index :pizzas, :sabor1_id
  end
end
