require 'pry'
class SecurityTypesController < ApplicationController
  before_action :set_security_type, only: [:show, :edit, :update, :destroy]


  # GET /security_types
  # GET /security_types.json
  def index
    @security_types = SecurityType.all
  end

  # GET /security_types/1
  # GET /security_types/1.json
  def show
  end

  # GET /security_types/new
  def new
    @security_type = SecurityType.new
  end

  # GET /security_types/1/edit
  def edit
  end

  # POST /security_types
  # POST /security_types.json
  def create
    @security_type = SecurityType.new(security_type_params)

    respond_to do |format|
      if @security_type.save!
        format.html { redirect_to @security_type, notice: 'Security type was successfully created.' }
        format.json { render :show, status: :created, location: @security_type }
      else
        format.html { render :new }
        format.json { render json: @security_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /security_types/1
  # PATCH/PUT /security_types/1.json
  def update
    respond_to do |format|
      if @security_type.update(security_type_params)
        format.html { redirect_to @security_type, notice: 'Security type was successfully updated.' }
        format.json { render :show, status: :ok, location: @security_type }
      else
        format.html { render :edit }
        format.json { render json: @security_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /security_types/1
  # DELETE /security_types/1.json
  def destroy
    @security_type.destroy
    respond_to do |format|
      format.html { redirect_to security_types_url, notice: 'Security type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_type
      @security_type = SecurityType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def security_type_params
      params.require(:security_type).permit(:security_type_name, :issuer_id)
    end
end
