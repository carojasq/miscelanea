class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :telephone
      t.string :address
      t.boolean :active, , default: true

      t.timestamps
    end
  end
end
