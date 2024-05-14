ActiveRecord::Schema[7.0].define(version: 2023_09_01_011905) do
  enable_extension "plpgsql"

  create_table "daily_usages", force: :cascade do |t|
    t.integer "product_id"
    t.integer "quantity_used"
    t.integer "quantity_projected"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "date_placed"
    t.integer "user_id"
    t.datetime "date_received"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_orders", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "quantity_shipped"
    t.integer "quantity_received"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.string "description"
    t.integer "on_hand"
    t.integer "uom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
