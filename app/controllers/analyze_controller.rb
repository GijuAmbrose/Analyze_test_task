class AnalyzeController < ApplicationController

  def index
    if params["values"].nil?
      @analyse_data = Security.fetch_analyse_data
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

  def graph_filter
    graph_filter = ArchivalNdsom.where(isin: params["isin_ids"], trade_date: params["startDate"] .. params["fromDate"]).uniq(&:trade_price)
    array_of_graph_data = []
    graph_filter.group_by(&:isin).each{|key, value| array_of_graph_data << {:name=> "#{key}", :data=> value.map(&:trade_price)}}
    @graph_data = array_of_graph_data
    @time_data = graph_filter.map(&:trade_time).uniq
    respond_to do |format|
      format.html
      format.js # actually means: if the client ask for js -> return file.js
    end
  end

end
















