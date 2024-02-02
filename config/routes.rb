Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  resources :products

  resources :orders

  post "/product_orders" => "product_orders#create"

  patch "/product_orders/:id" => "product_orders#update"

  post "/daily_usages" => "daily_usages#create"

  patch "/daily_usages/:id" => "daily_usages#update"

  get "/daily_usages" => "daily_usages#index"

  get "/daily_usages/:id" => "daily_usages#show"
end
