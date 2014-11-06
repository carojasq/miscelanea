class RenameOrdeLineToOrderDetail < ActiveRecord::Migration
  def change
  	rename_table :order_lines, :order_details
  end
end
