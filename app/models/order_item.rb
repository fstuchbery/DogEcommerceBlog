class OrderItem < ApplicationRecord
  belongs_to :order  # An order item belongs to an order
  belongs_to :product  # An order item belongs to a product

  validates :quantity, :price_per_unit, :total_price, presence: true
end
