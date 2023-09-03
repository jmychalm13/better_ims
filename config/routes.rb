Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  resources :products

  get "/orders" => "orders#index"

  post "/orders" => "orders#create"
end
