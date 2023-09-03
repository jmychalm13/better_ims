class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def create
    product = Product.create(
      product_name: params["product_name"],
      description: params["description"],
      on_hand: params["on_hand"],
      Uom: params["Uom"],
    )

    render json: product.as_json
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product.as_json
  end
end
