class CreateLojas < ActiveRecord::Migration[6.1]
  def change
    create_table :lojas do |t|
      t.time :abertura
      t.time :fechamento

      t.timestamps
    end
  end
end
