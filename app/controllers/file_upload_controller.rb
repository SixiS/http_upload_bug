class FileUploadController < ApplicationController
  def index

  end

  def create
    file_upload = FileUpload.new(file_upload_params)

    @file_size = file_upload.file_size
    render :index
  end

  private

  def file_upload_params
    results = params.require(:file_upload).permit(:description)
    results[:file_details] = params[:file_upload][:file_details] || {}
    results
  end
end
