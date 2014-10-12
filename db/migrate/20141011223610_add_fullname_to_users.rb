class AddFullnameToUsers < ActiveRecord::Migration
  def change
  	add_column :sellers, :full_name, :string
  	add_column :admins, :full_name, :string
  end
end
