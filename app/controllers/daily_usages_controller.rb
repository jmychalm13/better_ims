class DailyUsagesController < ApplicationController
  def create
    products = params[:products]
    products.each do |id, v|
      DailyUsage.create(
        # should I add .to_i to these variables?
        product_id: id,
        quantity_used: v,
      )
      product = Product.find(id)
      quantity = product.on_hand - v.to_i
      product.update(
         on_hand: quantity,
      )
    end
    render json: { message: "Created" }
  end

  def index
    @daily_usages = DailyUsage.all
    render :index
  end

  def show
    @daily_usages = DailyUsage.where(created_at: ..Date.today)   
    render :show
  end

  def update
    daily_usage = DailyUsage.find(params[:id])
    daily_usage.update(
      quantity_used: params[:quantity_used] || daily_usage.quantity_used,
    )
    if daily_usage.valid?
      render json: daily_usage.as_json
    else
      render json: { errors: daily_usage.errors.full_messages }, status: 422
    end
  end
end
