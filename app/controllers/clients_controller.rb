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
    groups = client.groups
    render json: {
      status: 200,
      client: client,
      group: groups
    }
  end

  def create

    payload_body = request.body.read
    if(payload_body != "")
      payload = JSON.parse(payload_body).symbolize_keys
    end

    client = Client.new

    client.name = payload[:name]

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

    payload_body = request.body.read
    if(payload_body != "")
      payload = JSON.parse(payload_body).symbolize_keys
    end

    client = Client.find params[:id]

    client.name = payload[:name]

    if client.save
      render json: {
        status: 200,
        client: client
      }
    end
  end

  def destroy
    client = Client.destroy params[:id]
    render json: {
      status: 204
    }
  end

end
