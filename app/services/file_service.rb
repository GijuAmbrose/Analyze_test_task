class FileService


  def initialize(file)
    @file = file
  end

  def upload
    file_name = fetch_file_name
    status = @file.present? && file_name!= false ? file_name.import(@file) : "incorrect file_name"
    return [status, @file.original_filename.split("-").first.downcase.tr("0-9","").camelize.underscore.pluralize]
  end

  def fetch_file_name
    if @file.original_filename.include?("securities") || @file.original_filename.include?("Archival_NDSOM")
      @file.original_filename.split("-").first.downcase.tr("0-9","").camelize.singularize.constantize
    end
  end

end

