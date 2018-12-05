class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def asignatures
    teacher = Teacher.find params[:id]
    @asignatures = teacher.asignatures

    render "asignatures/index"
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new permit_parmas
    if @teacher.save
      redirect_to teachers_path(@teacher), notice: "Registro creado correctamente."
    else
      render :new
    end
  end

  def destroy
    @teacher = Teacher.find params[:id]
    if @teacher.destroy
      redirect_to teachers_path(@teacher), notice: "Registro eliminado correctamente."
    else
      redirect_to teachers_path(@ateacher), notice: "Registro NO eliminado."
    end
  end

  private
  def permit_parmas
    params.require(:teacher).permit(:name)
  end
end
