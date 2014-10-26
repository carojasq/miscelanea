class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :value
      t.references :user, index: true

      t.timestamps
    end
  end
end
