class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :date_placed
      t.integer :user_id
      t.datetime :date_received

      t.timestamps
    end
  end
end
