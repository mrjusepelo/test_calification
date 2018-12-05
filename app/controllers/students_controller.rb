class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def new_calification
    @asignature_student = AsignatureStudent.find(params[:id])
  end
  def create_calification
    @asignature_student = AsignatureStudent.find(params[:id])
    @asignature_student.update(value: params[:student][:value])
    if @asignature_student.save
      students_asignature_path(@asignature_student.asignature_id)
      redirect_to students_asignature_path(@asignature_student.asignature_id)
    else
      render "new_calification", error: "Error: #{@asignature_student.errors.full_messages.to_sentence}"
    end

  end

  def create
    @student = Student.new permit_parmas
    if @student.save
      redirect_to students_path(@student), notice: "Registro creado correctamente."
    else
      puts "===errors=> #{@student.errors.full_messages.to_sentence}"
      render :new
    end
  end

  def destroy
    @student = Student.find params[:id]
    if @student.destroy
      redirect_to students_path(@student), notice: "Registro eliminado correctamente."
    else
      redirect_to students_path(@astudent), notice: "Registro NO eliminado."
    end
  end

  private
  def permit_parmas
    # params.require(:student).permit(:name, asignature_ids: []) if create_calification != "create_calification"

    # if create_calification == "create_calification"
    #   params.require(:asignature_students).permit(:id, :value)
    # else
      params.require(:student).permit(:name, asignature_ids: [], asignature_students_attribute: [:id, :value])
    # end
  end
end
