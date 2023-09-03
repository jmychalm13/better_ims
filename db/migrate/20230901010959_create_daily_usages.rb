class CreateDailyUsages < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_usages do |t|
      t.integer :product_id
      t.integer :quantity_used
      t.integer :quantity_projected
      t.datetime :date

      t.timestamps
    end
  end
end
