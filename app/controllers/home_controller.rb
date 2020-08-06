require './app/services/file_service.rb'

class HomeController < ApplicationController

  def index
  end

  def settings; end

  def add_security; end

  def upload_trade_data; end

  def upload_file
    if status[0] == true
      return redirect_to status[1], notice: "Successfully uploaded csv file."
    else
      return redirect_to status[1], alert: "Uploading Failed"
    end
  end

end
