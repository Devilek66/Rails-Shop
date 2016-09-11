class ProductsController < ApplicationController
  def index
    @products = Product.all

  end

  def show
  end

  def new
    @products = Product.new

  end
  def create 
  @products=Product.new(product_params)
    if @products.save
      redirect_to products_path
    end
  end


  def edit
  end
  private 
  
  def product_params
    params.require(:product).permit(:name)
  end
end
