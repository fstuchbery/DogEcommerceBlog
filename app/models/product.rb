class Product < ApplicationRecord
  belongs_to :category # A product belongs to a category
  has_many :order_items, dependent: :destroy # A product can appear in many order items
  has_many :orders, through: :order_items # A product can be part of many orders
  has_many :product_images, dependent: :destroy # A product can have many images

  validates :product_name, :description, :price, :category_id, presence: true
  validates :product_name, length: { maximum: 100 }
  validates :description, length: { maximum: 500 }
  validates :price, numericality: { greater_than: 0 }
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
