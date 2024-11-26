class CartController < ApplicationController
      # Show the cart
      def show
        session[:cart].delete_if do |product_id, _|
          # Check if product exists in the database
          !Product.exists?(product_id)
        end
        # Retrieve product details for the items in the cart
        @products = Product.where(id: session[:cart].keys)
        @cart_items = session[:cart].map do |product_id, quantity|
          product = Product.find(product_id)
          { product: product, quantity: quantity }
        end
      end

  # Add product to the cart
  def add
    product = Product.find(params[:product_id])
    
    # Initialize the cart if it's empty
    session[:cart] ||= {}

    # Add or update the product quantity in the cart
    if session[:cart][product.id.to_s]
      session[:cart][product.id.to_s] += 1
    else
      session[:cart][product.id.to_s] = 1
    end

    redirect_to cart_path, notice: "#{product.product_name} added to cart!"
  end

  # Remove product from the cart
  def remove
    product = Product.find(params[:product_id])
    session[:cart].delete(product.id.to_s)

    redirect_to cart_path, notice: "#{product.product_name} removed from cart!"
  end

  end

