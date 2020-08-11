require 'pry'
class SecuritiesController < ApplicationController
  before_action :set_security, only: [:show, :edit, :update, :destroy]

  # GET /securities
  # GET /securities.json
  def index
    @securities = params[:format].present? && params[:format] == "csv" ? Security.all : Security.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.csv { send_data @securities.to_csv, filename: "securities-#{Date.today}.csv" }
    end
  end

  # GET /securities/1
  # GET /securities/1.json
  def show
  end

  # GET /securities/new
  def new
    @security = Security.new
  end

  # GET /securities/1/edit
  def edit
  end

  # POST /securities
  # POST /securities.json
  def create
    @security = Security.new(security_params)

    respond_to do |format|
      if @security.save
        format.html { redirect_to @security, notice: 'Security was successfully created.' }
        format.json { render :show, status: :created, location: @security }
      else
        format.html { render :new }
        format.json { render json: @security.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /securities/1
  # PATCH/PUT /securities/1.json
  def update
    respond_to do |format|
      if @security.update(security_params)
        format.html { redirect_to @security, notice: 'Security was successfully updated.' }
        format.json { render :show, status: :ok, location: @security }
      else
        format.html { render :edit }
        format.json { render json: @security.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /securities/1
  # DELETE /securities/1.json
  def destroy
    @security.destroy
    respond_to do |format|
      format.html { redirect_to securities_url, notice: 'Security was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def issuer_security
    issuer_security = SecurityType.where(issuer_id: params["issuer_id"]).pluck(:id, :security_type_name).to_h
    respond_to do |format|
      format.json  { render :json => {issuer_security: issuer_security} }
    end
  end

  def rating_agency_security
    rating_agency_security = Rating.where(rating_agency_id: params["rating_agency_id"]).pluck(:id, :rating).to_h
    respond_to do |format|
      format.json  { render :json => {rating: rating_agency_security} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security
      @security = Security.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def security_params
      params.require(:security).permit(:security_name, :isin, :issue_date, :maturity_date, :outstanding_stock, :face_value, :coupon_rate, :issuer_id, :security_type_id, :interest_frequency_id, :rating_id, :rating_agency_id)
    end
end
