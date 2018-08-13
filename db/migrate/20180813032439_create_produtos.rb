class CreateProdutos < ActiveRecord::Migration[5.2]
  def change
    create_table :produtos do |t|
      t.string :nome_produto
      t.string :descricao_produto
      t.decimal :preco_produto, precision: 8, scale: 2
      t.boolean :esta_ativo

      t.timestamps
    end
  end
end
