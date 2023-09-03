class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def create
    product = Product.create()
  end
end
