class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.references :order, index: true
      t.references :sale, index: true
      t.references :product, index: true
      t.integer :quantity
      t.float :final_unit_price
      t.float :final_total_price
      t.timestamps
    end
  end
end
