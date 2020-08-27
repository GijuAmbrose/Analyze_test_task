class PortFoliosController < ApplicationController
  
  def index
    fetch_analyse_data
    params["values"].nil? ?  show_client_portfolio : create_client_portfolio 
    respond_to do |format|
      format.html
      format.js # actually means: if the client ask for js -> return file.js
    end
  end

  def show_client_portfolio
    sec_ids = PortFolio.find_by(client_id: params["client_id"])&.port_folio_security&.pluck(:security_id)
    sec_ids.map(&:to_s) if sec_ids.present?
    @values = @analyse_data.select{|x| sec_ids.include?(x.id)} if sec_ids.present?
    @analyse_data = @analyse_data.select{|x| sec_ids.exclude?(x.id)} if sec_ids.present?
  end

  def create_client_portfolio
    port_folio = PortFolio.where(client_id: params["client_id"].to_i).first_or_create
    PortFolioSecurity.where(port_folio_id: port_folio.id, security_id: params["values"].values.flatten.last.to_i).first_or_create
    port_folio_sec_ids = Client.find(params["client_id"].to_i).port_folio.port_folio_security.map(&:security_id)
    port_folio_sec_ids += [params["values"].values.flatten.last.to_i]
    @values = @analyse_data.select{|x| port_folio_sec_ids.include?(x.id)}
    @analyse_data = @analyse_data.select{|x| port_folio_sec_ids.exclude?(x.id)}
  end

  def filter_by_isin(values,isis, string)
    if string == 'analyse'
      @analyse_data = values.select { |x| x.isin.match?(isis) }
    else
      @values =  values.select { |x| x.isin.match?(isis) }
    end
  end

  def fetch_analyse_data
    @analyse_data = Security.fetch_analyse_data
  end

  def sort
    @analyse_data = Security.fetch_analyse_data
    port_folio_sec_ids = Client.find(params["client_id"].to_i).port_folio.port_folio_security.map(&:security_id) if params["client_id"].present?
    @values = @analyse_data.select{|x| port_folio_sec_ids.include?(x.id)} if params["client_id"].present?
    params[:ajax_call] == 'analyse' ? filter_by_isin(@analyse_data, params[:isis],'analyse') : filter_by_isin(@values, params[:isis], 'selected') if params[:ajax_call].present?
  end

  def client_port_folio_remove
    Client.find(params["client_id"].to_i).port_folio.port_folio_security.where(security_id: params["security_id"].values.flatten.last.to_i).first.delete
    fetch_analyse_data
    port_folio_sec_ids = Client.find(params["client_id"].to_i).port_folio.port_folio_security.map(&:security_id)
    @values = @analyse_data.select{|x| port_folio_sec_ids.include?(x.id)}
    @analyse_data = @analyse_data.select{|x| port_folio_sec_ids.exclude?(x.id)}
    respond_to do |format|
      format.html
      format.js # actually means: if the client ask for js -> return file.js
    end
  end

end
