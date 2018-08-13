class ItemAcompanhamento < ApplicationRecord
  belongs_to :item_pedido
  belongs_to :acompanhamento
end
