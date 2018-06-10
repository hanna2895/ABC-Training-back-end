class FileController < ApplicationController

  def index
    files = File.all
    render json: {
      status: 200,
      files: files
    }
  end

  def show
    file = File.find params[:id]
    render json: {
      status: 200,
      file: file
    }
  end

  def create
    @file = File.new(params[:files])

    if @file.save
      #iterate through each of the files
      params[:files][:document_data].each do |file|
          @file.documents.create!(:document => file)
          #create a document associated with the item that has just been created
        end
        render :show, status: :created, location: @file
    else
      render json: @file.errors, status: :unprocessable_entity
    end
  end

  # def create
  #
  #   # payload_body = request.body.read
  #   # if(payload_body != "")
  #   #   payload = JSON.parse(payload_body).symbolize_keys
  #   # end
  #
  #   puts ""
  #   pp params
  #   puts "-----this is params from the create route in the file controller -----"
  #   pp params[:files]
  #   puts "--------- this is what files is ----------"
  #   puts ""
  #
  #   # binding.pry
  #
  #   file = File.new(params[:files])
  #
  #   # file.name = params[:filename]
  #   #
  #   # if params[:group_id]
  #   #   file.group_id = params[:group_id]
  #   # end
  #   #
  #   # if params[:description]
  #   #   file.description = params[:description]
  #   # end
  #
  #   # if params[:tempfile]
  #   #   file.url = params[:tempfile]
  #   # end
  #
  #
  #   #
  #   # document.attach.params[:document]
  #   # file.url = url_for(file.document)
  # #
  # #   puts ""
  # #   pp file
  # #   puts ""
  # #
  # #
  # #   if file.save
  # #     render json: {
  # #       status: 201,
  # #       file: file
  # #     }
  # #   else
  # #     render json: {
  # #       status: 400,
  # #       message: "Your file could not be uploaded.",
  # #       file: file
  # #     }
  # #   end
  # end

  # def file_params
  #   params.require(:files).permit(:name, :description, :document_data => []) #add document_data as a permitted parameter
  # end

end
