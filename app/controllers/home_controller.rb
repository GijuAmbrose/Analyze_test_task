require './app/services/file_service.rb'

class HomeController < ApplicationController

  def index
  end

  def settings; end

  def add_security; end

  def upload_trade_data; end

  def upload_file
    status = FileService.new(params[:csv_file]).upload
    if status[0] == true
      return redirect_to "/#{status[1]}", notice: "Successfully uploaded csv file."
    elsif status[0] == "incorrect file_name"
      return redirect_to root_url, alert: "The file uploading failed. Incorrect file_name!!"
    else
      return redirect_to root_url, alert: "Uploading Failed"
    end
  end

end
