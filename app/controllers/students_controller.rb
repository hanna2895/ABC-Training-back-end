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

    payload_body = request.body.read
    if(payload_body != "")
      payload = JSON.parse(payload_body).symbolize_keys
    end

    student = Student.new

    if payload[:name]
      student.name = payload[:name]
    end
    if payload[:email]
      student.email = payload[:email]
    end
    if payload[:password]
      student.password = payload[:password]
    end
    if payload[:group_id]
      student.group_id = payload[:group_id]
    end

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

    payload_body = request.body.read
    if(payload_body != "")
      payload = JSON.parse(payload_body).symbolize_keys
    end

    student = Student.find params[:id]

    if payload[:name]
      student.name = payload[:name]
    end
    if payload[:email]
      student.email = payload[:email]
    end
    if payload[:password]
      student.password = payload[:password]
    end
    if payload[:group_id]
      student.group_id = payload[:group_id]
    end

    if student.save
      render json: {
        status: 202,
        student: student
      }
    else
      render json: {
        status: 422,
        student: student,
        message: "This student was not successfully updated."
      }
    end

  end

  def destroy
    student = Student.destroy params[:id]
    render json: {
      status: 204,
      deleted_student: student
    }
  end


  # private - probably can delete this
  # def student_params
  #   params.required(:student).permit(:name, :email, :password) # add password here eventually
  # end
end
