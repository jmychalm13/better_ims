class AddUomToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :Uom, :integer
  end
end
