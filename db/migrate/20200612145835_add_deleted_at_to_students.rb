class AddDeletedAtToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :deleted_at, :datetime
    add_index :students, :deleted_at
  end
end
