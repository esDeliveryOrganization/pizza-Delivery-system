class AddBairroToEnderecos < ActiveRecord::Migration[6.1]
  def change
    add_column :enderecos, :bairro, :string
  end
end
