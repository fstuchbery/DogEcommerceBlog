class Product < ApplicationRecord
  belongs_to :category  # A product belongs to a category
  has_many :order_items  # A product can appear in many order items
  has_many :orders, through: :order_items  # A product can be part of many orders
  has_many :product_images  # A product can have many images

  validates :product_name, :price, :stock_quantity, presence: true
end
