class CreateAsignatureStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :asignature_students do |t|
      t.references :student, foreign_key: true
      t.references :asignature, foreign_key: true
      t.float :value, default: 0

      t.timestamps
    end
  end
end
