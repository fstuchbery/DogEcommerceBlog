class CartController < ApplicationController
  # Show the cart
  def show
    # Retrieve product details for the items in the cart
    @products = Product.where(id: session[:cart].keys)
    @cart_items = session[:cart].map do |product_id, quantity|
      product = Product.find(product_id)
      { product:, quantity: }
    end
  end

  # Add product to the cart
  def add
    product = Product.find(params[:product_id])

    # Initialize the cart if it's empty
    initialize_cart

    # Add or update the product quantity in the cart
    update_cart(product)

    redirect_to rooot_path, notice: "#{product.product_name} added to cart!"
  end

  def initialize_cart
    session[:cart] ||= {}
  end

  def update_cart(product)
    if session[:cart][product.id.to_s]
      session[:cart][product.id.to_s] += 1
    else
      session[:cart][product.id.to_s] = 1
    end
    # Remove product from the cart and more
  def remove
    product = Product.find(params[:product_id])
    session[:cart].delete(product.id.to_s)

    redirect_to cart_path, notice: "#{product.product_name} removed from cart!"
  end
end
