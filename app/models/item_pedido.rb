class ItemPedido < ApplicationRecord
  belongs_to :produto
  belongs_to :pedido
  has_many :item_acompanhamentos, :dependent => :destroy
  accepts_nested_attributes_for :item_acompanhamentos
end
