class PortFoliosController < ApplicationController
  
  def index
    if params["values"].nil?
      @analyse_data = Security.fetch_analyse_data
    else
      port_folio = PortFolio.first_or_create!(client_id: params["client_id"].to_i)
      Security.find(params["values"].values.first.last).update(port_folio_id: port_folio.id)
      @values = params["values"]
    end
    respond_to do |format|
      format.html
      format.js # actually means: if the client ask for js -> return file.js
    end
  end

end
