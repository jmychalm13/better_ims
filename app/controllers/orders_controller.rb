class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    orders = Order.all
    render json: orders.as_json
  end

  def create
    pp params[:order]
    order = Order.create(
      user_id: current_user.id,
      date_placed: Time.now,
    )
    if order.valid?
      params[:order].each { |id, quantity|
        ProductOrder.create(
          product_id: id,
          quantity_shipped: quantity,
          order_id: order.id,
        )
      }
      render json: order.as_json
      # render jbuilder partial that you pass productOrder and products
    else
      render json: { errors: order.errors.full_messages }, status: 422
    end
  end

  def show
    order = Order.find(params[:id])
    render json: order.as_json
  end

  def update
    order = Order.find(params[:id])
    order.update(
      date_received: params[:date_received] || order.date_received,
    )
    render json: order.as_json
  end
end
