class CreateAsignatureCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :asignature_courses do |t|
      t.references :course, foreign_key: true
      t.references :asignature, foreign_key: true

      t.timestamps
    end
  end
end
