class AddAdmToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :adm, :boolean
  end
end
