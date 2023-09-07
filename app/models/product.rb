class Product < ApplicationRecord
  has_many :inventories
  has_many :daily_usages
  has_many :product_orders
  has_many :pars
end
