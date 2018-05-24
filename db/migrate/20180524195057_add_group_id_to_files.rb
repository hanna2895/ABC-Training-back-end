class AddGroupIdToFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :files, :group_id, :integer
  end
end
