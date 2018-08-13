class CreateItemAcompanhamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :item_acompanhamentos do |t|
      t.decimal :preco_item_acompanhamento, precision: 8, scale: 2
      t.references :item_pedido, foreign_key: true
      t.references :acompanhamento, foreign_key: true

      t.timestamps
    end
  end
end
