class AddFieldTeacherToAsignature < ActiveRecord::Migration[5.2]
  def change
    add_reference :asignatures, :teacher, foreign_key: true
  end
end
