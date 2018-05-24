class AddStudentIdToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :student_id, :integer
  end
end
