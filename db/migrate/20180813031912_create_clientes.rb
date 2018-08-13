class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :nome_cliente
      t.string :status_cliente

      t.timestamps
    end
  end
end
