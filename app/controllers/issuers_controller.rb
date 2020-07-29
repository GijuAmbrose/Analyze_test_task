class IssuersController < ApplicationController
  include Autocompletable

  before_action :set_issuer, only: [:show, :edit, :update, :destroy]
  before_action :force_json, only: :search

  # GET /issuers
  # GET /issuers.json
  def index
    @issuers = Issuer.all
  end

  # GET /issuers/1
  # GET /issuers/1.json
  def show
  end

  # GET /issuers/new
  def new
    @issuer = Issuer.new
  end

  # GET /issuers/1/edit
  def edit
  end

  # POST /issuers
  # POST /issuers.json
  def create
    @issuer = Issuer.new(issuer_params)

    respond_to do |format|
      binding.pry
      if @issuer.save
        format.html { redirect_to @issuer, notice: 'Issuer was successfully created.' }
        format.json { render :show, status: :created, location: @issuer }
      else
        format.html { render :new }
        format.json { render json: @issuer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issuers/1
  # PATCH/PUT /issuers/1.json
  def update
    respond_to do |format|
      if @issuer.update(issuer_params)
        format.html { redirect_to @issuer, notice: 'Issuer was successfully updated.' }
        format.json { render :show, status: :ok, location: @issuer }
      else
        format.html { render :edit }
        format.json { render json: @issuer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issuers/1
  # DELETE /issuers/1.json
  def destroy
    @issuer.destroy
    respond_to do |format|
      format.html { redirect_to issuers_url, notice: 'Issuer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def autocomplete
    # results = JobTitle.select(:job_title, :occ_all).where("occ_all > 1")
   #                    .where.not(soc_code: nil)
   #                    .search_by_job_title(params[:q])
   #                    .reorder('occ_all DESC')[0..25]
    results = Issuer.select(:name)
                      .where("lower(name) LIKE '#{params[:q].downcase}%'")
    render json: {message: "Success", items: select2_autocomplete_results(results, {id: 'issuer_name', value: 'issuer_name'})}, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issuer
      @issuer = Issuer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issuer_params
      params.require(:issuer).permit(:name)
    end

end
