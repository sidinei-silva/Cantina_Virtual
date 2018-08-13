class CreateItemPedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :item_pedidos do |t|
      t.integer :quantidade_item_pedido
      t.decimal :total_item_pedido, precision: 8, scale: 2
      t.references :produto, foreign_key: true
      t.references :pedido, foreign_key: true

      t.timestamps
    end
  end
end
