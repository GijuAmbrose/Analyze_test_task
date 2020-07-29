class ArchivalNdsomsController < ApplicationController
  before_action :set_archival_ndsom, only: [:show, :edit, :update, :destroy]

  # GET /archival_ndsoms
  # GET /archival_ndsoms.json
  def index
    @archival_ndsoms = ArchivalNdsom.all
  end

  # GET /archival_ndsoms/1
  # GET /archival_ndsoms/1.json
  def show
  end

  # GET /archival_ndsoms/new
  def new
    @archival_ndsom = ArchivalNdsom.new
  end

  # GET /archival_ndsoms/1/edit
  def edit
  end

  # POST /archival_ndsoms
  # POST /archival_ndsoms.json
  def create
    @archival_ndsom = ArchivalNdsom.new(archival_ndsom_params)

    respond_to do |format|
      if @archival_ndsom.save
        format.html { redirect_to @archival_ndsom, notice: 'Archival ndsom was successfully created.' }
        format.json { render :show, status: :created, location: @archival_ndsom }
      else
        format.html { render :new }
        format.json { render json: @archival_ndsom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /archival_ndsoms/1
  # PATCH/PUT /archival_ndsoms/1.json
  def update
    respond_to do |format|
      if @archival_ndsom.update(archival_ndsom_params)
        format.html { redirect_to @archival_ndsom, notice: 'Archival ndsom was successfully updated.' }
        format.json { render :show, status: :ok, location: @archival_ndsom }
      else
        format.html { render :edit }
        format.json { render json: @archival_ndsom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archival_ndsoms/1
  # DELETE /archival_ndsoms/1.json
  def destroy
    @archival_ndsom.destroy
    respond_to do |format|
      format.html { redirect_to archival_ndsoms_url, notice: 'Archival ndsom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archival_ndsom
      @archival_ndsom = ArchivalNdsom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def archival_ndsom_params
      params.fetch(:archival_ndsom, {})
    end
end
