class PortFoliosController < ApplicationController
  
  def index
    if params["values"].nil?
      @values = []
      sec_ids = PortFolio.find_by(client_id: params["client_id"])&.port_folio_security&.pluck(:security_id)
      sec_ids.map(&:to_s) if sec_ids.present?
      @values = Security.select("securities.isin", "interest_frequencies.frequency", "securities.interest_frequency_id", "securities.issue_date", "securities.maturity_date", "securities.id", "archival_ndsoms.ytm", "archival_ndsoms.id as a_id", "archival_ndsoms.trade_price")
                                  .joins("INNER JOIN archival_ndsoms ON archival_ndsoms.isin = securities.isin AND securities.id IN (#{sec_ids.join(', ')})
                                  JOIN interest_frequencies ON interest_frequencies.id = securities.interest_frequency_id ORDER BY securities.isin").uniq(&:isin) if sec_ids.present?
      @analyse_data = Security.fetch_analyse_data
    else
      binding.pry
      port_folio = PortFolio.create!(client_id: params["client_id"].to_i)
      binding.pry
      PortFolioSecurity.create(port_folio_id: port_folio.id, security_id: params["values"].values.flatten.last.to_i)
      binding.pry
      @values = Security.select("securities.isin", "interest_frequencies.frequency", "securities.interest_frequency_id", "securities.issue_date", "securities.maturity_date", "securities.id", "archival_ndsoms.ytm", "archival_ndsoms.id as a_id", "archival_ndsoms.trade_price")
                                  .joins("INNER JOIN archival_ndsoms ON archival_ndsoms.isin = securities.isin AND securities.id IN (#{params["values"].values.flatten.join(', ')})
                                  JOIN interest_frequencies ON interest_frequencies.id = securities.interest_frequency_id ORDER BY securities.isin").uniq(&:isin)
    end
    respond_to do |format|
      format.html
      format.js # actually means: if the client ask for js -> return file.js
    end
  end

end
