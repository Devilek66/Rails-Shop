class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new

  end
  
  def create 
  @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Produkt dodany"
      redirect_to products_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    flash[:notice] = "Produkt zaktualizowany"
    redirect_to products_path
  end
  
  private 
  def product_params
    params.require(:product).permit(:name,:price,:description,:sale,:picture)
  end
end
