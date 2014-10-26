class AddUserIdToEgress < ActiveRecord::Migration
  def change
  	add_column :egresses, :user_id, :integer
  end
end
