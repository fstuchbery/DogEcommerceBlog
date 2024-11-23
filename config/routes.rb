Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  
# Routes for customers
get '/customers', to: 'customers#index'  # List all customers
get '/customers/:id', to: 'customers#show'  # Show a specific customer
post '/customers', to: 'customers#create'  # Create a new customer
put '/customers/:id', to: 'customers#update'  # Update a customer
delete '/customers/:id', to: 'customers#destroy'  # Delete a customer

# Routes for categories
get '/categories', to: 'categories#index'  # List all categories
get '/categories/:id', to: 'categories#show'  # Show a specific category

# Routes for products
get '/products', to: 'products#index'  # List all products
get '/products/:id', to: 'products#show'  # Show a specific product
post '/products', to: 'products#create'  # Create a new product
put '/products/:id', to: 'products#update'  # Update a product
delete '/products/:id', to: 'products#destroy'  # Delete a product

# Routes for product images
get '/products/:product_id/product_images', to: 'product_images#index'  # List all images for a product
post '/products/:product_id/product_images', to: 'product_images#create'  # Create a new image for a product
delete '/product_images/:id', to: 'product_images#destroy'  # Delete a product image

# Routes for orders
get '/customers/:customer_id/orders', to: 'orders#index'  # List all orders for a customer
get '/orders/:id', to: 'orders#show'  # Show a specific order
post '/customers/:customer_id/orders', to: 'orders#create'  # Create a new order for a customer
put '/orders/:id', to: 'orders#update'  # Update an order
delete '/orders/:id', to: 'orders#destroy'  # Delete an order

# Routes for order items
get '/orders/:order_id/order_items', to: 'order_items#index'  # List all items in an order
post '/orders/:order_id/order_items', to: 'order_items#create'  # Create a new order item
delete '/order_items/:id', to: 'order_items#destroy'  # Delete an order item

# Routes for payments
get '/orders/:order_id/payment', to: 'payments#show'  # Show payment for an order
post '/orders/:order_id/payment', to: 'payments#create'  # Create a payment for an order
put '/payments/:id', to: 'payments#update'  # Update a payment

# Set the root of the application
root 'products#index'  # Change to whatever page you'd like to be the default

  
end
