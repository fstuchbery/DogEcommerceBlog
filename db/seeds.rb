# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Seed Categories

Admin.create(username: "admin", password: "password")

categories = [
  {id: 1, category_name: 'Food', description: 'Nutritious food for dogs, including kibble and treats.' },
  {id: 2, category_name: 'Furniture', description: 'Comfortable dog beds, crates, and more for your pet\'s rest.' },
  {id: 3, category_name: 'Accessories', description: 'Leashes, harnesses, and travel gear for dogs.' },
  {id: 4, category_name: 'Toys', description: 'Interactive toys to keep your dog entertained.' },
  {id: 5, category_name: 'Grooming', description: 'Shampoos, brushes, and grooming supplies for your dog.' },
  {id: 6, category_name: 'Clothing', description: 'Dog clothing, coats, and apparel to keep your pet stylish and warm.' },
  {id: 7, category_name: 'Health', description: 'Products to help maintain your dog\'s health and well-being.' }
]

categories.each do |category|
  Category.find_or_create_by!(category_name: category[:category_name]) do |c|
    c.description = category[:description]
  end
end

# Seed Dog Products
products = [
  {id: 1, product_name: 'Premium Dog Food', description: 'Nutritious and delicious kibble for adult dogs, rich in protein and essential nutrients.', price: 39.99, category_id: 1, stock_quantity: 150 },
  {id: 2, product_name: 'Orthopedic Dog Bed', description: 'Ultra-comfortable, memory foam dog bed designed to support joint health for senior dogs.', price: 79.99, category_id: 2, stock_quantity: 40 },
  {id: 3, product_name: 'Dog Leash', description: 'Strong, adjustable leash perfect for walks and training. Made from durable nylon.', price: 15.99, category_id: 3, stock_quantity: 200 },
  {id: 4, product_name: 'Dog Harness', description: 'No-pull dog harness designed for comfort and control during walks.', price: 22.99, category_id: 3, stock_quantity: 120 },
  {id: 5, product_name: 'Interactive Dog Toy', description: 'A durable squeaky toy that keeps your dog engaged and entertained for hours.', price: 10.99, category_id: 4, stock_quantity: 250 },
  {id: 6, product_name: 'Dog Grooming Kit', description: 'Complete grooming set with brushes, clippers, and nail trimmers to keep your dog looking great.', price: 29.99, category_id: 5, stock_quantity: 80 },
  {id: 7, product_name: 'Dog Shampoo', description: 'Gentle, hypoallergenic dog shampoo for sensitive skin. Leaves your dog’s coat soft and shiny.', price: 12.99, category_id: 5, stock_quantity: 100 },
  {id: 8, product_name: 'Dog Coat', description: 'Stylish and warm dog coat for cold weather walks, available in various sizes.', price: 24.99, category_id: 6, stock_quantity: 60 },
  {id: 9, product_name: 'Dog Teeth Cleaning Chews', description: 'Dental chews designed to help clean your dog\'s teeth and freshen their breath.', price: 18.99, category_id: 7, stock_quantity: 180 },
  {id: 10, product_name: 'Dog Water Bottle', description: 'Portable water bottle with attached bowl for easy hydration during walks and travel.', price: 13.99, category_id: 3, stock_quantity: 150 }
]

products.each do |product|
  Product.create!(product)
end
