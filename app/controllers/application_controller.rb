class ApplicationController < ActionController::Base
  before_action :initialize_cart

  allow_browser versions: :modern

  private

  # Initializes the cart if it doesn't already exist in the session
  def initialize_cart
    session[:cart] ||= {}
  end
end
