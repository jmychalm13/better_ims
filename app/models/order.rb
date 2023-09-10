class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders
  has_many :products, through: :product_orders

  def friendly_date_placed
    date_placed.strftime("%A, %b %d")
  end

  def friendly_date_received
    if date_received
      date_received.strftime("%A, %b, %d")
    else
      nil
    end
  end
end
