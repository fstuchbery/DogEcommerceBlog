class OrderItem < ApplicationRecord
  belongs_to :order  # An order item belongs to an order
  belongs_to :product  # An order item belongs to a product

  validates :order_id, :product_id, :quantity, :price_per_unit, presence: true
  validates :quantity, numericality: { greater_than: 0 }
  validates :price_per_unit, numericality: { greater_than: 0 }
end
