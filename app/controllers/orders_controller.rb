class OrdersController < ApplicationController
  before_action :authenticate_user

  require 'date'

  def index
    @orders = Order.all
    render :index
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
      # render :show
      # render jbuilder partial that you pass productOrder and products
    else
      render json: { errors: order.errors.full_messages }, status: 422
    end
  end

  def show
    @order = Order.find(params[:id])
    render :show
  end

  def update
    order = Order.find(params[:id])
    date = DateTime.now()

    order.update(
      # change this to be today's date
      date_received: date || order.date_received,
    )
    # use a model method .where to pull back all productOrders with that order_id match params.id
    product_orders = ProductOrder.where(order_id: params[:id])
    # loop through productOrders that are returned and set the received quantity based on the params
    product_orders.each do |product_order|
      pp product_order
      pp params[product_order.id.to_s]
      product_order.update(
        quantity_received: params[product_order.id.to_s]
      )
    end
        # this will be an hash where the key is the productOrder ID and value is quantity received
    render json: order.as_json
  end
end
