class Teacher < ApplicationRecord
  has_many :courses
  has_many :asignatures
end
