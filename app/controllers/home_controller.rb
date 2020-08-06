require './app/services/file_service.rb'

class HomeController < ApplicationController

  def index
  end

  def settings; end

  def add_security; end

  def upload_trade_data; end

  def upload_file
    status, error_msg = FileService.new(params[:csv_file])
    binding.pry
    if status == 'true'
      return redirect_to error_msg, notice: "Successfully uploaded csv file."
    else
      return redirect_to root_url, alert: "You are uploading a wrong file, please check!!"
    end
  end

end
