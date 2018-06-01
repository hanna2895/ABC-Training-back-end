class AddRowToFileTable < ActiveRecord::Migration[5.2]
  def change
    add_column :files, :document, :bytea
  end
end
