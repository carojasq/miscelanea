class ChangeQuantityToStock < ActiveRecord::Migration
  def change
  	  	rename_column :products, :quantity, :stock

  end
end
