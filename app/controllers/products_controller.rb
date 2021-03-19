class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end
end
