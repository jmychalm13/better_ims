require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "test", email: "test@test.com", password: "password", password_confirmation: "password")
    post "/sessions.json", params: {email: "test@test.com", password: "password"}
    data = JSON.parse(response.body)
    @jwt = data["jwt"]

    @order_params = {
      user_id: @user.id,
      date_placed: Time.now,
      order: {
        product_id_1: 2,
        product_id_2: 3,
      }
    }
  end
  
  test "index" do
    get "/orders.json", headers: {
      "Authorization" => "Bearer #{@jwt}"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Order.count, data.length
  end

  test "create" do
    assert_difference "Order.count", 1 do
      post "/orders.json", params: @order_params, as: :json,
      headers: {
        "Authorization" => "Bearer #{@jwt}"
      }
      assert_response 200
    end
  end

  test "show" do
    get "/orders/#{Order.first.id}.json", headers: {
      "Authorization" => "Bearer #{@jwt}"
    }
    assert_response 200
  end

  test "update" do
    time = Time.now.utc.round(0).iso8601(10)
    patch "/orders/#{Order.first.id}.json", headers: {
      "Authorization" => "Bearer #{@jwt}"
    },
    params: {
      date_received: time,
    }
    assert_response 200

    data = JSON.parse(response.body)
    actual_date_received = Time.parse(data["date_received"]).round(0).iso8601(10)
    assert_equal time, actual_date_received
  end

  test "destroy" do
    assert_difference "Order.count", -1 do
      delete "/orders/#{Order.first.id}.json", headers: {
        "Authorization" => "Bearer #{@jwt}"
      }
      assert_response 200
    end
  end
end
