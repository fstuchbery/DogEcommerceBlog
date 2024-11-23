class Payment < ApplicationRecord
belongs_to :order  # A payment belongs to an order

validates :payment_date, :payment_amount, :payment_method, :payment_status, presence: true
end
