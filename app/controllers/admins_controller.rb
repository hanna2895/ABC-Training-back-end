class AdminsController < ApplicationController

  def index
    admins = Admin.all
    render json: {
      status: 200,
      admins: admins
    }
  end

  def show
    admin = Admin.find params[:id] # will need to change this once I add user log in functionality
    render json: {
      status: 200,
      admin: admin
    }
  end

  def create
    admin = Admin.new(admin_params)
    if admin.save

      render json: {
        status: 201,
        admin: admin
      }
    else
      render json: {
        status: 422,
        admin: admin,
        message: "This admin account could not be successfully created."
      }
    end
  end

  def update
    admin = Admin.find params[:id]
    admin.update(admin_params)
    render json: {
      status: 202,
      admin: admin
    }

  end

  def destroy
    admin = Admin.destroy params[:id]
    render json: {
      status: 204,
      deleted_admin: admin
    }
  end


  private
  def admin_params
    params.required(:admin).permit(:name, :email, :is_lead_admin, :password) # add password here eventually
  end
end
