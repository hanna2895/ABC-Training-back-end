class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :file, foreign_key: true
      t.string :document

      t.timestamps
    end
  end
end
