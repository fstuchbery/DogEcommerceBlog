class ProductImage < ApplicationRecord
  belongs_to :product  # A product image belongs to a product

  validates :product_id, :image_url, presence: true
  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "must be a valid URL" }
end
