class CreateEgresses < ActiveRecord::Migration
  def change
    create_table :egresses do |t|
      t.string :description
      t.integer :value

      t.timestamps
    end
  end
end
