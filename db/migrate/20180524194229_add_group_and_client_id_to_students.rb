class AddGroupAndClientIdToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :group_id, :integer
    add_column :students, :client_id, :integer
  end
end
