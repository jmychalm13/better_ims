Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  resources :products

  get "/orders" => "orders#index"

  post "/orders" => "orders#create"

  patch "/orders/:id" => "orders#update"
  
  get "/orders/:id" => "orders#show"

  post "/product_orders" => "product_orders#create"

  patch "/product_orders/:id" => "product_orders#update"

  post "/daily_usages" => "daily_usages#create"

  patch "/daily_usages/:id" => "daily_usages#update"

  get "/daily_usages" => "daily_usages#index"
end
