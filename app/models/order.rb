class Order < ApplicationRecord
  belongs_to :customer  # An order belongs to a customer
  has_many :order_items  # An order can have many items
  has_many :products, through: :order_items  # An order can contain many products through order_items
  has_one :payment  # An order can have one payment

  validates :order_status, :total_price, :shipping_address, presence: true
end
