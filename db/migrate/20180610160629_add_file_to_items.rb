class AddFileToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :files, :file, :string
  end
end
