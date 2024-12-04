Rails.application.routes.draw do
  

  # Health check route (optional)
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA related routes (optional)
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Customer routes
  get '/customers', to: 'customers#index'  # List all customers
  get '/customers/:id', to: 'customers#show'  # Show a specific customer
  post '/customers', to: 'customers#create'  # Create a new customer

  # Category routes
  get '/categories', to: 'categories#index'  # List all categories
  get '/categories/:id', to: 'categories#show', as: 'category' # Show a specific category

  

  # Product search route (ensure it's below the standard product routes)
  get '/products/search', to: 'products#search', as: 'search_products'  # Searching under categories

  # Product routes for customers
  get '/products', to: 'products#index'  # List all products
  get '/products/:id', to: 'products#show', as: 'product'  # Show a specific product
  post '/products', to: 'products#create'  # Create a new product
  put '/products/:id', to: 'products#update'  # Update a product
  delete '/products/:id', to: 'products#destroy'  # Delete a product

  # Product images routes
  get '/products/:product_id/product_images', to: 'product_images#index'  # List all images for a product
  post '/products/:product_id/product_images', to: 'product_images#create'  # Create a new image for a product
  delete '/product_images/:id', to: 'product_images#destroy'  # Delete a product image
  
  # Order routes
  get '/customers/:customer_id/orders', to: 'orders#index'  # List all orders for a customer
  get '/orders/:id', to: 'orders#show'  # Show a specific order
  post '/customers/:customer_id/orders', to: 'orders#create'  # Create a new order for a customer
  put '/orders/:id', to: 'orders#update'  # Update an order
  delete '/orders/:id', to: 'orders#destroy'  # Delete an order

  # Order items routes
  get '/orders/:order_id/order_items', to: 'order_items#index'  # List all items in an order
  post '/orders/:order_id/order_items', to: 'order_items#create'  # Create a new order item
  delete '/order_items/:id', to: 'order_items#destroy'  # Delete an order item

  # Payment routes
  get '/orders/:order_id/payment', to: 'payments#show'  # Show payment for an order
  post '/orders/:order_id/payment', to: 'payments#create'  # Create a payment for an order
  put '/payments/:id', to: 'payments#update'  # Update a payment


   # Define route for viewing the cart (show action)
   get '/cart', to: 'cart#show', as: 'cart'

   # Route to add a product to the cart (post request)
   post '/cart/add/:product_id', to: 'cart#add', as: 'add_to_cart'
 
   # Route to remove a product from the cart (delete request)
   delete '/cart/remove/:product_id', to: 'cart#remove', as: 'remove_from_cart'

   post '/cart/checkout', to: 'cart#checkout', as: 'checkout'

  # Admin Authentication Routes
  get '/admin/session/new', to: 'admin/sessions#new', as: 'login'
  post '/admin/session', to: 'admin/sessions#create'
  delete '/admin/session', to: 'admin/sessions#destroy', as: 'logout'
  
  # Admin routes
  get '/admin/dashboard', to: 'admin/dashboard#index', as: 'admin_dashboard'
  get '/admin/products', to: 'admin/products#index', as: 'admin_products'
  get '/admin/products/new', to: 'admin/products#new', as: 'new_admin_product'
  post '/admin/products', to: 'admin/products#create', as: 'create_admin_product'
  get '/admin/products/:id/edit', to: 'admin/products#edit', as: 'edit_admin_product'
  put '/admin/products/:id', to: 'admin/products#update', as: 'update_admin_product'
  patch '/admin/products/:id', to: 'admin/products#update'
  delete '/admin/products/:id', to: 'admin/products#destroy', as: 'destroy_admin_product'

  # Root route for the application (this could be for products or the admin dashboard)
  root 'products#index', as: 'rooot'  # Default root route for customers viewing products
end
