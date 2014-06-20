class PetTreatmentsController < ApplicationController
  before_action :set_pet_treatment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pet_treatments
  # GET /pet_treatments.json
  def index
    @pet_treatments = PetTreatment.all
  end

  # GET /pet_treatments/1
  # GET /pet_treatments/1.json
  def show
  end

  # GET /pet_treatments/new
  def new
    @pet_treatment = PetTreatment.new
  end

  # GET /pet_treatments/1/edit
  def edit
  end

  # POST /pet_treatments
  # POST /pet_treatments.json
  def create
    @pet_treatment = PetTreatment.new(pet_treatment_params)

    respond_to do |format|
      if @pet_treatment.save
        format.html { redirect_to @pet_treatment, notice: 'Pet treatment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pet_treatment }
      else
        format.html { render action: 'new' }
        format.json { render json: @pet_treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_treatments/1
  # PATCH/PUT /pet_treatments/1.json
  def update
    respond_to do |format|
      if @pet_treatment.update(pet_treatment_params)
        format.html { redirect_to @pet_treatment, notice: 'Pet treatment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pet_treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_treatments/1
  # DELETE /pet_treatments/1.json
  def destroy
    @pet_treatment.destroy
    respond_to do |format|
      format.html { redirect_to pet_treatments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_treatment
      @pet_treatment = PetTreatment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_treatment_params
      params.require(:pet_treatment).permit(:medical_history_no, :pet_id, :treatment_id)
    end
end
