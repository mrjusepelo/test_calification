class Course < ApplicationRecord
  belongs_to :teacher

  has_many :student_courses
  has_many :students, through: :student_courses

  has_many :asignature_courses
  has_many :asignatures, through: :asignature_courses
end
