class Acompanhamento < ApplicationRecord
  belongs_to :produto
  has_many :item_acompanhamentos
  accepts_nested_attributes_for :item_acompanhamentos
  validates :nome_acompanhamento, :preco_acompanhamento, presence: true
end
