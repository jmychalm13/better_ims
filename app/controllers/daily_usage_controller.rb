class DailyUsageController < ApplicationController
  def create
    daily_usage = DailyUsage.create(
      product_id: params[:product_id],
      quantity_used: params[:quantity_used],
      quantity_projected: params[:quantity_projected],
      date: params[:date],
    )
    if daily_usage.valid?
      render json: daily_usage.as_json
    else
      render json: { errors: order.errors.full_messages }, status: 422
    end
  end

  def update
    daily_usage = DailyUsage.find(params[:id])
    daily_usage.update(
      quantity_used: params[:quantity_used] || daily_usage.quantity_used,
    )
    if daily_usage.valid?
      render json: daily_usage.as_json
    else
      render json: { errors: order.errors.full_messages }, status: 422
    end
  end
end
