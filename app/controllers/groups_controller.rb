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
      group = Group.new(group_params)
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
      group = Group.find params[:id]
      group.update(group_params)

      render json: {
        status: 200,
        group: group
      }
    end

    def destroy
      group = Group.destroy params[:id]
      render json: {
        status: 204
      }
    end

    private

    def group_params
      params.required(:group).permit(:name, :client_id)
    end



end
