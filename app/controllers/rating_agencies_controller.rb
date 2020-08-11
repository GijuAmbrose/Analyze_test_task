class RatingAgenciesController < ApplicationController
  include Autocompletable

  before_action :set_rating_agency, only: [:show, :edit, :update, :destroy]
  before_action :force_json, only: :search
  
  # GET /rating_agencies
  # GET /rating_agencies.json
  def index
    @rating_agencies = RatingAgency.all
  end

  # GET /rating_agencies/1
  # GET /rating_agencies/1.json
  def show
  end

  # GET /rating_agencies/new
  def new
    @rating_agency = RatingAgency.new
  end

  # GET /rating_agencies/1/edit
  def edit
  end

  # POST /rating_agencies
  # POST /rating_agencies.json
  def create
    @rating_agency = RatingAgency.new(rating_agency_params)

    respond_to do |format|
      if @rating_agency.save
        format.html { redirect_to @rating_agency, notice: 'Rating agency was successfully created.' }
        format.json { render :show, status: :created, location: @rating_agency }
      else
        format.html { render :new }
        format.json { render json: @rating_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rating_agencies/1
  # PATCH/PUT /rating_agencies/1.json
  def update
    respond_to do |format|
      if @rating_agency.update(rating_agency_params)
        format.html { redirect_to @rating_agency, notice: 'Rating agency was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating_agency }
      else
        format.html { render :edit }
        format.json { render json: @rating_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_agencies/1
  # DELETE /rating_agencies/1.json
  def destroy
    @rating_agency.destroy
    respond_to do |format|
      format.html { redirect_to rating_agencies_url, notice: 'Rating agency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    q = params[:q].downcase
    @issuer_auto_complete = RatingAgency.where("name LIKE ?", "%#{q}%")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating_agency
      @rating_agency = RatingAgency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rating_agency_params
      params.require(:rating_agency).permit(:rating_agency_name)
    end

    def force_json
      request.format = :json
    end

end
