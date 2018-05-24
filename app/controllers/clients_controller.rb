class ClientsController < ApplicationController

  def index
    clients = Client.all
    render json: {
      status: 200,
      clients: clients
    }
  end

  def show
    client = Client.find params[:id]
    render json: {
      status: 200,
      client: client
    }
  end

  def create
    client = Client.new(client_params)
    if client.save
      render json: {
        status: 201,
        client: client
      }
    else
      render json: {
        status: 422,
        client: client
      }
    end
  end

  def update
    client = Client.find params[:id]
    client.update(client_params)

    render json: {
      status: 200,
      client: client
    }
  end

  def destroy
    client = Client.destroy params[:id]
    render json: {
      status: 204
    }
  end

  private

  def client_params
    params.required(:client).permit(:name)
  end



end
