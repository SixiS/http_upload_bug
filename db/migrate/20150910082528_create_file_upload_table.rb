class CreateFileUploadTable < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.text :description
      t.text :file_details
    end
  end
end
