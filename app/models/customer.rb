class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
   #      :recoverable, :rememberable, :validatable

  has_many :orders  # A customer can have many orders

  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "must be a 10-digit phone number" }
  validates :province, presence: true, length: { is: 2 }
end
