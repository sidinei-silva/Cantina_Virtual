class Produto < ApplicationRecord
  has_one_attached :image
  has_many :acompanhamentos
  has_many :item_pedidos
end
