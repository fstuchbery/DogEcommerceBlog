class OrderController < ApplicationController
  def invoice
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
end
