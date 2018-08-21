class AddMotivoCancelamentoToPedido < ActiveRecord::Migration[5.2]
  def change
    add_column :pedidos, :motivo_cancelamento, :string
  end
end
