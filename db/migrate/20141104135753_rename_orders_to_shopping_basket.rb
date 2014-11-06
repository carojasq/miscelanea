class RenameOrdersToShoppingBasket < ActiveRecord::Migration
  def change
  	rename_table :orders, :shopping_baskets
  end
end
