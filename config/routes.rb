Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  resources :products

  get "/orders" => "orders#index"

  post "/orders" => "orders#create"

  patch "/orders/:id" => "orders#update"

  post "/product_orders" => "product_orders#create"

  patch "/product_orders/:id" => "product_orders#update"

  post "/daily_usages" => "daily_usage#create"

  patch "/daily_usages/:id" => "daily_usage#update"
end
