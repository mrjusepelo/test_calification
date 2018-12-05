class AsignatureStudent < ApplicationRecord
  belongs_to :student
  belongs_to :asignature

  validate :calification

  def calification
    data = Student.count + Time.now.strftime('%M').to_i
    if self.value > data
      errors.add(:value, "No puede superar el minuto en curso de la hora actual junto con la cantidad de estudiantes creados en la base de datos")
    end

  end

end
