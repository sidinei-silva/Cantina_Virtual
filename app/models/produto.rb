class Produto < ApplicationRecord
  has_one_attached :image
  has_many :acompanhamentos
  has_many :item_pedidos
  validates :nome_produto, :descricao_produto, :preco_produto, presence: true
  validate :image_validate

  private
  def image_validate
    if image.attached? && !image.content_type.in?(%w(image/jpg image/png image/jpeg))
      errors.add(:image, 'Imagem tem que ser PNG, JPG ou JPEG')
    elsif !image.attached?
      errors.add(:image, 'Imagem não pode ficar vazia')

    end
  end
end
