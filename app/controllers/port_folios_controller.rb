class PortFoliosController < ApplicationController
  
  def index
    if params["values"].nil?
      sec_ids = PortFolio.find_by(client_id: params["client_id"])&.port_folio_security&.pluck(:security_id)
      sec_ids.map(&:to_s) if sec_ids.present?
      @values = Security.select("securities.isin", "interest_frequencies.frequency", "securities.interest_frequency_id", "securities.issue_date", "securities.maturity_date", "securities.id", "archival_ndsoms.ytm", "archival_ndsoms.id as a_id", "archival_ndsoms.trade_price")
                                  .joins("INNER JOIN archival_ndsoms ON archival_ndsoms.isin = securities.isin AND securities.id IN (#{sec_ids.join(', ')})
                                  JOIN interest_frequencies ON interest_frequencies.id = securities.interest_frequency_id ORDER BY securities.isin").uniq(&:isin) if sec_ids.present?
      @analyse_data = Security.fetch_analyse_data
    else
      port_folio = PortFolio.where(client_id: params["client_id"].to_i).first_or_create
      PortFolioSecurity.where(port_folio_id: port_folio.id, security_id: params["values"].values.flatten.last.to_i).first_or_create
      portd_folio_sec_ids = Client.find(params["client_id"].to_i).port_folio.port_folio_security.map(&:security_id)
      portd_folio_sec_ids += [params["values"].values.flatten.last.to_i]
      @values = Security.select("securities.isin", "interest_frequencies.frequency", "securities.interest_frequency_id", "securities.issue_date", "securities.maturity_date", "securities.id", "archival_ndsoms.ytm", "archival_ndsoms.id as a_id", "archival_ndsoms.trade_price")
                                  .joins("INNER JOIN archival_ndsoms ON archival_ndsoms.isin = securities.isin AND securities.id IN (#{portd_folio_sec_ids.join(', ')})
                                  JOIN interest_frequencies ON interest_frequencies.id = securities.interest_frequency_id ORDER BY securities.isin").uniq(&:isin)
      @analyse_data = Security.fetch_analyse_data
      params[:ajax_call] == 'analyse' ? filter_by_isin(@analyse_data, params[:isis],'analyse') : filter_by_isin(@values, params[:isis], 'selected') if params[:ajax_call].present?
    end
    respond_to do |format|
      format.html
      format.js # actually means: if the client ask for js -> return file.js
    end
  end

  # def filter_by_isin(values,isis, string)
  #   if string == 'analyse'
  #     @analyse_data = values.select { |x| x.isin.match?(isis) }
  #   else
  #     @values =  values.select { |x| x.isin.match?(isis) }
  #   end
  # end

  # def sort
  #   @analyse_data = Security.fetch_analyse_data
  #   portd_folio_sec_ids = Client.find(params["client_id"].to_i).port_folio.port_folio_security.map(&:security_id) if params["client_id"].present?
  #   @values = Security.select("securities.isin", "interest_frequencies.frequency", "securities.interest_frequency_id", "securities.issue_date", "securities.maturity_date", "securities.id", "archival_ndsoms.ytm", "archival_ndsoms.id as a_id", "archival_ndsoms.trade_price")
  #                                 .joins("INNER JOIN archival_ndsoms ON archival_ndsoms.isin = securities.isin AND securities.id IN (#{portd_folio_sec_ids.join(', ')})
  #                                 JOIN interest_frequencies ON interest_frequencies.id = securities.interest_frequency_id ORDER BY securities.isin").uniq(&:isin) if params["client_id"].present?
  #   params[:ajax_call] == 'analyse' ? filter_by_isin(@analyse_data, params[:isis],'analyse') : filter_by_isin(@values, params[:isis], 'selected') if params[:ajax_call].present?
  # end


end
