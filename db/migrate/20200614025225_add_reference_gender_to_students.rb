class AddReferenceGenderToStudents < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :gender, foreign_key: { to_table: :genders }
  end
end
