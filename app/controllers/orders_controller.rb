class OrdersController < ApplicationController
  def index
    orders = Order.all
    render json: orders.as_json
  end

  def create
    order = Order.create(
      user_id: params[:user_id],
      date_placed: params[:date_placed],
      date_received: params[:date_received],
    )
    render json: order.as_json
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
