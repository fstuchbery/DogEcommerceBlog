class Customer < ApplicationRecord
  has_many :orders  # A customer can have many orders

  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "must be a 10-digit phone number" }
end
