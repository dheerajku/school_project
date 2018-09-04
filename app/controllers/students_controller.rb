class StudentsController < ApplicationController

  def index
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.where(params[:id])
  end

  def new
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.new
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.build(student_params)

    if @student.save
    redirect_to teacher_students_path(@teacher)
    else
      render 'new'
    end
  end
  
  def show
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.find(params[:id])
    if @student.update(student_params)
      redirect_to teacher_students_path(@teacher)
    else
      render 'new'
    end
  end

  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.find(params[:id])
    @student.destroy

    redirect_to teacher_students_path(@teacher)
  end





private
  def student_params
    params.require(:student).permit(:name, :number)
  end
end
