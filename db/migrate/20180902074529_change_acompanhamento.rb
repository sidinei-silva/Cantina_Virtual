class ChangeAcompanhamento < ActiveRecord::Migration[5.2]
  def change
    change_column_default :acompanhamentos, :esta_ativo, true
  end
end
