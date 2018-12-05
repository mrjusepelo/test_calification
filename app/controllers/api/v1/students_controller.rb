
class Api::V1::StudentsController < ApiController
  def index
    @students = Student.includes(:asignature_students, :asignatures)
  end
end
