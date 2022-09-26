class StudentsController < ApplicationController

  def index
    students = Student.all
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

  # query params in the index action
  def index
    students = Student.all
    if params[:name]
      students = students.select do |student|
        student.first_name.downcase.include?(params[:name].downcase) || student.last_name.downcase.include?(params[:name].downcase)
      end
    end
    render json: students
  end

end
