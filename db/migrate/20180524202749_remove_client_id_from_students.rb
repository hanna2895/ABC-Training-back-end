class RemoveClientIdFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :client_id
  end
end
