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
  def checkout
    # Creates an order with the current date and the total price of the cart
    @order = Order.create(
      customer_id: 1,
      order_date: Date.today,
      order_status: 'Pending',  # for the time being, this order is in the pending stage.
      total_price: cart_total,
      payment_status: 'Unpaid'  
    )

    # Create order items for each product in the cart
    session[:cart].each do |product_id, quantity|
      product = Product.find(product_id)
      @order.order_items.create(
        product: product,
        quantity: quantity,
        price_per_unit: product.price,
        total_price: product.price * quantity
      )
    end

    # Clear the cart after the order is created
    session[:cart] = {}

    # Redirect to the order show page with a success message
    redirect_to order_path(@order), notice: "Order created successfully!"
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

  def cart_total
    total = 0
    session[:cart].each do |product_id, quantity|
      product = Product.find(product_id)
      total += product.price * quantity
    end
    total
  end

end
