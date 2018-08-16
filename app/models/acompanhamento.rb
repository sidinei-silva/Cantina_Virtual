class Acompanhamento < ApplicationRecord
  has_one :produto
  has_many :item_acompanhamentos
  accepts_nested_attributes_for :item_acompanhamentos
end
