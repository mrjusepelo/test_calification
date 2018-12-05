class Asignature < ApplicationRecord
  belongs_to :teacher
  has_many :asignature_courses
  has_many :courses, through: :asignature_courses

  has_many :asignature_students
  has_many :students, through: :asignature_students

  accepts_nested_attributes_for :courses, :allow_destroy => true
end
