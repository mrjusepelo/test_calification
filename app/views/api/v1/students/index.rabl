object @students
attributes :id, :name

child :asignature_students do
    attributes :id#, :value, :student_id, :asignature_id

    node :calification do |model|
      model.value
    end
    node :asignatura do |model|
      model.asignature.name unless model.asignature.nil?
    end
end
