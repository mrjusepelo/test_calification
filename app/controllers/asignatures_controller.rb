class AsignaturesController < ApplicationController
  def index
    @asignatures = Asignature.all
  end

  def students
    asignature = Asignature.find params[:id]
    @students = asignature.students

    render "students/index"
  end

  def new
    @asignature = Asignature.new
  end

  def create
    @asignature = Asignature.new permit_parmas
    if @asignature.save
      redirect_to asignatures_path(@asignature), notice: "Registro creado correctamente."
    else
      render :new
    end
  end

  def destroy
    @asignature = Asignature.find params[:id]
    if @asignature.destroy
      redirect_to asignatures_path(@asignature), notice: "Registro eliminado correctamente."
    else
      redirect_to asignatures_path(@aasignature), notice: "Registro NO eliminado."
    end
  end

  private
  def permit_parmas
    params.require(:asignature).permit(:name, :teacher_id, course_ids: [])
  end
end
