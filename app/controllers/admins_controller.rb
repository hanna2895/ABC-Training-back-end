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

    payload_body = request.body.read
    if(payload_body != "")
      payload = JSON.parse(payload_body).symbolize_keys
    end

    admin = Admin.new

    admin.name = payload[:name]
    admin.email = payload[:email]
    admin.password = payload[:password]
    admin.is_lead_admin = payload[:is_lead_admin]

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

    payload_body = request.body.read
    if(payload_body != "")
      payload = JSON.parse(payload_body).symbolize_keys
    end

    admin = Admin.find params[:id]

    if payload[:name]
      admin.name = payload[:name]
    end
    if payload[:email]
      admin.email = payload[:email]
    end
    if payload[:password]
      admin.password = payload[:password]
    end
    if payload[:is_lead_admin]
      admin.is_lead_admin = payload[:is_lead_admin]
    end

    if admin.save
      render json: {
        status: 202,
        admin: admin
      }
    else
      render json: {
        status: 422,
        admin: admin,
        message: "This admin could not be successfully updated."
      }
    end

  end

  def destroy
    admin = Admin.destroy params[:id]
    render json: {
      status: 204,
      deleted_admin: admin
    }
  end


  # private
  # def admin_params
  #   params.required(:admin).permit(:name, :email, :is_lead_admin, :password) # add password here eventually
  # end
end
