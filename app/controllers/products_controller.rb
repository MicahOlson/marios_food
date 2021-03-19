class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  private
    def product_params
      params.require(:product).permit(:name, :genre)
    end
end
