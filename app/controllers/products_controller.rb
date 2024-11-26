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
    
        # Filter by search keyword (in name or description)
        if params[:search].present?
          @products = @products.where("product_name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
        end
    
        # Filter by category
        if params[:category_id].present?
          @products = @products.where(category_id: params[:category_id])
        end
    
        render :search  # Render the same index view, but with filtered products
      end

      
end
