class AnalyzeController < ApplicationController

  def index
    if params["values"].nil?
      @analyse_data = ArchivalNdsom.fetch_analyse_data
      if params[:ajax_call].present? && params[:ajax_call] == "true" && params[:isis].present?
         @analyse_data = @analyse_data.select { |x| x.isin.match?(params[:isis]) }
      else
         @analyse_data
      end
    else
      @values = params["values"]
    end
    respond_to do |format|
      format.html
      format.js # actually means: if the client ask for js -> return file.js
    end
  end
end