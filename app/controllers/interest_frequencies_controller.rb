class InterestFrequenciesController < ApplicationController
  before_action :set_interest_frequency, only: [:show, :edit, :update, :destroy]

  # GET /interest_frequencies
  # GET /interest_frequencies.json
  def index
    @interest_frequencies = InterestFrequency.all
  end

  # GET /interest_frequencies/1
  # GET /interest_frequencies/1.json
  def show
  end

  # GET /interest_frequencies/new
  def new
    @interest_frequency = InterestFrequency.new
  end

  # GET /interest_frequencies/1/edit
  def edit
  end

  # POST /interest_frequencies
  # POST /interest_frequencies.json
  def create
    @interest_frequency = InterestFrequency.new(interest_frequency_params)

    respond_to do |format|
      if @interest_frequency.save
        format.html { redirect_to @interest_frequency, notice: 'Interest frequency was successfully created.' }
        format.json { render :show, status: :created, location: @interest_frequency }
      else
        format.html { render :new }
        format.json { render json: @interest_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interest_frequencies/1
  # PATCH/PUT /interest_frequencies/1.json
  def update
    respond_to do |format|
      if @interest_frequency.update(interest_frequency_params)
        format.html { redirect_to @interest_frequency, notice: 'Interest frequency was successfully updated.' }
        format.json { render :show, status: :ok, location: @interest_frequency }
      else
        format.html { render :edit }
        format.json { render json: @interest_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interest_frequencies/1
  # DELETE /interest_frequencies/1.json
  def destroy
    @interest_frequency.destroy
    respond_to do |format|
      format.html { redirect_to interest_frequencies_url, notice: 'Interest frequency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest_frequency
      @interest_frequency = InterestFrequency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interest_frequency_params
      params.require(:interest_frequency).permit(:frequency)
    end
end
