class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.string :status_pedido
      t.decimal :total_pedido, precision: 8, scale: 2
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
