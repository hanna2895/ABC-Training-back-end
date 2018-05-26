class SessionsController < ApplicationController
  # use payload instead of params?

  def create
    # check if the person logging in is an admin or a student
    # Admins.find_by_email
    # if exists, cool. then authenticate
    # else, Students.find_by_email
    # if exists, cool. then authenticate
    # else sorry, try again.
    admin = Admin.find_by_email(params[:email])
    student = Student.find_by_email(params[:email])


    if admin
      if admin && admin.authenticate(params[:password])
        session[:is_admin] = true
        session[:id] = admin.id.to_s + "a"
        render json: {
          status: 200,
          message: "You have successfully logged in as #{admin.name}"
        }
      else
        session[:message] = "Incorrect login credentials. Please try again."
        render json: {
          status: 400,
          message: "Incorrect login credentials. Please try again"
        }
      end
    elsif student
      if student && student.authenticate(params[:password])
        session[:is_admin] = false
        session[:id] = student.id.to_s + "s"
        render json: {
          status: 200,
          message: "You have successfully logged in as #{student.name}"
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

end # end for controller
