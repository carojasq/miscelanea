class AddSellerToEgress < ActiveRecord::Migration
  def change
  	add_reference :egresses, :seller, index: true
  end
end
