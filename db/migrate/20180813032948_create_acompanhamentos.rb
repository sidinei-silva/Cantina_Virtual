class CreateAcompanhamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :acompanhamentos do |t|
      t.decimal :preco_acompanhamento, precision: 8, scale: 2
      t.string :nome_acompanhamento
      t.boolean :esta_ativo
      t.references :produto, foreign_key: true

      t.timestamps
    end
  end
end
