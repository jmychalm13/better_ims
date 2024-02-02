require "test_helper"

class DailyUsageControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/daily_usages.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal DailyUsage.count, data.length
  end

  test "create" do
    assert_difference "DailyUsage.count", 1 do
      post "/daily_usages.json", params: {
        products: {
          Product.first.id => 1
        }
      }
      assert_response 200

      data = JSON.parse(response.body)
      assert_equal "Created", data["message"]
    end
  end

  test "update" do
    product = Product.first
    daily_usage = DailyUsage.create(
      product_id: Product.first.id,
      quantity_used: 1,
      quantity_projected: 5,
      date: Time.now
    )
    patch "/daily_usages/#{daily_usage.id}.json",
    params: {
      quantity_used: 2
      }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal 2, data["quantity_used"]
  end
end
