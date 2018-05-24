class AddGroupIdToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :group_id, :integer
  end
end
