require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "product_name", "uom", "on_hand"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: {
        product_name: "test",
        description: "test test",
        on_hand: 2,
        uom: 2
      }
      assert_response 200
    end
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: {
      description: "another description"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "another description", data["description"]
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
