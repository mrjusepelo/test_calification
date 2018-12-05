class Student < ApplicationRecord
  has_many :student_courses, dependent: :destroy
  has_many :courses, through: :student_courses

  has_many :asignature_students, dependent: :destroy
  has_many :asignatures, through: :asignature_students

  accepts_nested_attributes_for :asignatures, :allow_destroy => true

end
