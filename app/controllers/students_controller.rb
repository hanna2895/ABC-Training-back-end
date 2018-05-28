class StudentsController < ApplicationController
  def index
    students = Student.all
    render json: {
      status: 200,
      students: students
    }
  end

  def unassigned
    unassigned_students  = Student.where(:group_id => nil)
    render json: {
      status: 200,
      unassigned_students: unassigned_students
    }
  end

  def show
    student = Student.find params[:id] # will need to change this once I add user log in functionality
    render json: {
      status: 200,
      student: student
    }
  end



  def create
    student = Student.new(student_params)
    if student.save
      render json: {
        status: 201,
        student: student
      }
    else
      render json: {
        status: 422,
        student: student
      }
    end
  end

  def update
    student = Student.find params[:id]
    student.update(student_params)
    render json: {
      status: 202,
      student: student
    }

  end

  def destroy
    student = Student.destroy params[:id]
    render json: {
      status: 204,
      deleted_student: student
    }
  end


  private
  def student_params
    params.required(:student).permit(:name, :email, :password) # add password here eventually
  end
end
