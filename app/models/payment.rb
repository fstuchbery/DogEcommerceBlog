class Payment < ApplicationRecord
belongs_to :order  # A payment belongs to an order

validates :order_id, :payment_date, :payment_amount, :payment_method, :payment_status, presence: true
  validates :payment_amount, numericality: { greater_than: 0 }
end
