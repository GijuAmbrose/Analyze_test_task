class HomeController < ApplicationController

  def index
  end

  def settings; end

  def add_security; end

  def upload_trade_data; end

  def analyze
    @analyse_data = ArchivalNdsom.select("securities.isin", "interest_frequencies.frequency", "securities.interest_frequency_id", "securities.issue_date", "securities.maturity_date", "securities.id", "archival_ndsoms.ytm", "archival_ndsoms.id as a_id").joins("INNER JOIN securities ON securities.isin = archival_ndsoms.isin JOIN interest_frequencies ON interest_frequencies.id = securities.interest_frequency_id").uniq(&:isin).take(15)
    if params[:ajax_call].present? && params[:ajax_call] == "true" && params[:isis].present?
       @analyse_data = @analyse_data.select { |x| x.isin.match?(params[:isis]) }
    else
       @analyse_data
    end
    respond_to do |format|
      format.html
      format.js # actually means: if the client ask for js -> return file.js
    end
  end


  def upload_file
    if params[:csv_file].present?
      begin
        if params[:csv_file].original_filename.include?("securities")
          Security.import(params[:csv_file])
        elsif params[:csv_file].original_filename.include?("Archival_NDSOM")
          ArchivalNdsom.import(params[:csv_file])
        else
          return redirect_to root_url, alert: "You are uploading a wrong file, please check!!"
        end
        return redirect_to securities_path, notice: "Successfully uploaded csv file."
      rescue => e
        return redirect_to root_url, alert: "Logic error, failed to upload file!"
      end

    else
      return redirect_to root_url, alert: "Failed to upload file!"
    end
  end

end
