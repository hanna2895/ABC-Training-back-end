class GroupsController < ApplicationController

    def index
      groups = Group.all
      render json: {
        status: 200,
        groups: groups
      }
    end

    def show
      group = Group.find params[:id]
      students = group.students
      render json: {
        status: 200,
        group: group,
        students: students
      }
    end

    def create

      payload_body = request.body.read
      if(payload_body != "")
        payload = JSON.parse(payload_body).symbolize_keys
      end

      group = Group.new

      group.name = payload[:name]
      group.client_id = payload[:client_id]

      if group.save
        render json: {
          status: 201,
          group: group
        }
      else
        render json: {
          status: 422,
          group: group
        }
      end
    end

    def update

      payload_body = request.body.read
      if(payload_body != "")
        payload = JSON.parse(payload_body).symbolize_keys
      end

      group = Group.find params[:id]

      if payload[:name]
        group.name = payload[:name]
      end
      if payload[:client_id]
        group.client_id = payload[:client_id]
      end

      if group.save
        render json: {
          status: 200,
          group: group
        }
      else
        render json: {
          status: 422,
          group: group
        }
      end
    end

    def destroy
      group = Group.destroy params[:id]
      render json: {
        status: 204
      }
    end

    private

    def group_params
      params.permit(:name, :client_id)
    end



end
