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

    if product
      render json: product.as_json
    else
      render json: { errors: product.errors.full_messages }, status: 422
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def update
    product = Product.find_by(id: params[:id])
    product.update(
      product_name: params[:product_name] || product.product_name,
      description: params[:description] || product.description,
      on_hand: params[:on_hand] || product.on_hand,
      Uom: params[:Uom] || product.Uom,
    )
    render json: product.as_json
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product has been destroyed" }
  end
end
