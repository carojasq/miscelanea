class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.date :valid_until
      t.attachment :document_file
      t.timestamps
    end
  end
end
