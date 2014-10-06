class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :quantity
      t.references :provider, index: true
      t.references :category, index: true
      t.boolean :active

      t.timestamps
    end
  end
end
