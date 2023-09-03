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
end
