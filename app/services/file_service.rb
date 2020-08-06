class FileService

  def self.file_upload(file)
    if file.present?
      if file.original_filename.include?("securities")
        path = "/securities"
        Security.import(file)
        status = [true, path]
      elsif file.original_filename.include?("Archival_NDSOM")
        path = "/archival_ndsoms"
        ArchivalNdsom.import(file)
        status = [true, path]
      else
        status = [false, "/"]
      end
    else
      status = [false, "/"]
    end
    return status
  end

end

