class ChangeProduto < ActiveRecord::Migration[5.2]
  def change
    change_column_default :produtos, :esta_ativo, true
  end
end
