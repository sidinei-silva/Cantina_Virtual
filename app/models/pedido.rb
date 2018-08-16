class Pedido < ApplicationRecord
  belongs_to :cliente
  has_many :item_pedidos, :dependent => :destroy
  accepts_nested_attributes_for :item_pedidos

end
