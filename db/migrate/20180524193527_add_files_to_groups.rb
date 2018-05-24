class AddFilesToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :file_id, :integer
  end
end
