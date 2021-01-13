require 'pry'
class StudentsController < ApplicationController
  
  def new
    @student = Student.new
  end
 
  def create
    # binding.pry
    @student = Student.new(student_params)
    if @student.save 
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  private
  def student_params
  params.require(:student).permit(:first_name, :last_name)
  end

end
