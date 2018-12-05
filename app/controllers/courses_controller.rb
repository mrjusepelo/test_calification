class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new permit_parmas
    if @course.save
      redirect_to courses_path(@course), notice: "Registro creado correctamente."
    else
      render :new
    end
  end

  def destroy
    @course = Course.find params[:id]
    if @course.destroy
      redirect_to courses_path(@course), notice: "Registro eliminado correctamente."
    else
      redirect_to courses_path(@acourse), notice: "Registro NO eliminado."
    end
  end

  private
  def permit_parmas
    params.require(:course).permit(:name, :teacher_id)
  end
end
