class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @categories = Category.all
    @products = Product.all

    apply_search_filter if params[:search].present?
    apply_category_filter if params[:category_id].present?

    render :search
  end

  private

  def apply_search_filter
    @products = @products.where("product_name LIKE ? OR description LIKE ?",
                                "%#{params[:search]}%", "%#{params[:search]}%")
  end

  def apply_category_filter
    @products = @products.where(category_id: params[:category_id])
  end
end
