class AddCpfDestToPedidos < ActiveRecord::Migration[6.1]
  def change
    add_column :pedidos, :cpfDestinatario, :string
  end
end
