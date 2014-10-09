class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :seller, index: true
      t.boolean :paid, default: false
      t.datetime :paid_at

      t.timestamps
    end
  end
end
