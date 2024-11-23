class Category < ApplicationRecord
    validates :category_name, :description, presence: true
    validates :category_name, length: { maximum: 20 }

 has_many :products  # A category has many products
end
