class SessionsController < ApplicationController
  # use payload instead of params?

  def create

    payload_body = request.body.read
    if(payload_body != "")
      payload = JSON.parse(payload_body).symbolize_keys
    end

    # check if the person logging in is an admin or a student
    # Admins.find_by_email
    # if exists, cool. then authenticate
    # else, Students.find_by_email
    # if exists, cool. then authenticate
    # else sorry, try again.
    admin = Admin.find_by_email(payload[:email])
    student = Student.find_by_email(payload[:email])

    if admin
      if admin && admin.authenticate(payload[:password])
        render json: {
          status: 200,
          message: "You have successfully logged in as #{admin.name}",
          user_type: "admin",
          user_id: admin.id,
          user_name: admin.name
        }
      else
        session[:message] = "Incorrect login credentials. Please try again."
        render json: {
          status: 400,
          message: "Incorrect login credentials. Please try again"
        }
      end
    elsif student
      if student && student.authenticate(payload[:password])
        render json: {
          status: 200,
          message: "You have successfully logged in as #{student.name}",
          user_type: "student",
          user_id: student.id,
          user_name: student.name
        }
      else
        session[:message] = "Incorrect login credentials. Please try again."
        render json: {
          status: 400,
          message: "Incorrect login credentials. Please try again"
        }
      end
    else
      session[:message] = "Incorrect login credentials. Please try again."
      render json: {
        status: 400,
        message: "Incorrect login credentials. Please try again"
      }
    end
  end # end for create route

  def destroy
    session[:user_id] = nil

    render json: {
      status: 200,
      message: "User logged out"
    }
  end

end # end for controller
