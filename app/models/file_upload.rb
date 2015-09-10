# class FileUpload
#   attr_accessor :file
#   def initialize(params)
#     self.file = params[:file]
#   end

#   def file_size
#     file.read.length
#   end
# end

class FileUpload < ActiveRecord::Base
  serialize :file_details, Hash

  def file_size
    file_details[:file].read.length
  end
end
