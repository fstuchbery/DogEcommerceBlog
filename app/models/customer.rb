class Customer < ApplicationRecord
  has_many :orders  # A customer can have many orders

  validates :email, presence: true, uniqueness: true
end
