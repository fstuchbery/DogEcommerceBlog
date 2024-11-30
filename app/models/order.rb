class Order < ApplicationRecord
  belongs_to :customer # An order belongs to a customer
  has_many :order_items, dependent: :destroy # An order can have many items
  has_many :products, through: :order_items, dependent: :destroy # An order can contain many
  products through order_items
  has_one :payment, dependent: :destroy # An order can have one payment

  validates :customer_id, :order_date, :total_price, :order_status, :payment_status, presence: true
  validates :total_price, numericality: { greater_than: 0 }
end
