class RemoveExtraColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :group_id
    remove_column :groups, :student_id
    remove_column :groups, :file_id
  end
end
