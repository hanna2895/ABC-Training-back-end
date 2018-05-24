class CreateFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :files do |t|
      t.string :name
      t.string :description
      t.string :url
    end
  end
end
