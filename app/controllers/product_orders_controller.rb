class ProductOrdersController < ApplicationController
  def create
    product_order = ProductOrder.create(
      product_id: params[:product_id],
      order_id: params[:order_id],
      quantity_shipped: params[:quantity_shipped],
      quantity_received: params[:quantity_received],
    )

    if product_order
      render json: product_order.as_json
    else
      render json: { errors: order.errors.full_messages }, status: 422
    end
  end
end
