class ProductImage < ApplicationRecord
  belongs_to :product  # A product image belongs to a product

  validates :image_url, presence: true
end
