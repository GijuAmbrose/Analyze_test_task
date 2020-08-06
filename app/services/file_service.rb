class FileService

  def initialize(file)
    file_upload(file)
  end

  def file_upload(file)
    binding.pry
    if file.present?
      begin
        if file.original_filename.include?("securities")
          path = securities_path
          Security.import(file)
        elsif file.original_filename.include?("Archival_NDSOM")
          path = archival_ndsoms_path
          ArchivalNdsom.import(file)
        else
          return redirect_to root_url, alert: "You are uploading a wrong file, please check!!"
        end
        return redirect_to path, notice: "Successfully uploaded csv file."
      rescue => e
        return redirect_to root_url, alert: "Logic error, failed to upload file!"
      end

    else
      return redirect_to root_url, alert: "Failed to upload file!"
    end
  end

end
