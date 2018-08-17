class Acompanhamento < ApplicationRecord
  belongs_to :produto
  has_many :item_acompanhamentos
  accepts_nested_attributes_for :item_acompanhamentos
end
