class ChangeReferenceForOrderDetail < ActiveRecord::Migration
  def change
  		rename_column :order_details, :order_id, :shopping_basket_id
  end
end
