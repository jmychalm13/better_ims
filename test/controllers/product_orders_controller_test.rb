require "test_helper"

class ProductOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = Product.create(
      product_name: "test",
      description:"test description",
      on_hand: 2,
      uom: 2
    )
    @order = Order.create(
      date_placed: "2023-09-18 21:19:15.507481",
      user_id: User.first.id,
      date_received: Time.now
    )
    @product_order = ProductOrder.create(
      product_id: @product.id,
      order_id: @order.id,
      quantity_shipped: 2,
      quantity_received: 1
    )
  end

  test "create" do
    assert_difference "ProductOrder.count", 1 do
      post "/product_orders.json", params: {
        product_id: @product.id,
        order_id: @order.id,
        quantity_shipped: 2,
        quantity_received: 1
      }
      assert_response 200
    end
  end

  test "update" do
    patch "/product_orders/#{@product_order.id}.json", params: {
      quantity_received: 0
    }
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal 0, data["quantity_received"]
  end
end
