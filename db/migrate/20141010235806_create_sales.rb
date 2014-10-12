class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :value
      t.references :seller, index: true

      t.timestamps
    end
  end
end
