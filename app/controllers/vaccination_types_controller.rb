class VaccinationTypesController < ApplicationController
  before_action :set_vaccination_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /vaccination_types
  # GET /vaccination_types.json
  def index
    @vaccination_types = VaccinationType.all
  end

  # GET /vaccination_types/1
  # GET /vaccination_types/1.json
  def show
  end

  # GET /vaccination_types/new
  def new
    @vaccination_type = VaccinationType.new
  end

  # GET /vaccination_types/1/edit
  def edit
  end

  # POST /vaccination_types
  # POST /vaccination_types.json
  def create
    @vaccination_type = VaccinationType.new(vaccination_type_params)

    respond_to do |format|
      if @vaccination_type.save
        format.html { redirect_to @vaccination_type, notice: 'Vaccination type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vaccination_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @vaccination_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vaccination_types/1
  # PATCH/PUT /vaccination_types/1.json
  def update
    respond_to do |format|
      if @vaccination_type.update(vaccination_type_params)
        format.html { redirect_to @vaccination_type, notice: 'Vaccination type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vaccination_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vaccination_types/1
  # DELETE /vaccination_types/1.json
  def destroy
    @vaccination_type.destroy
    respond_to do |format|
      format.html { redirect_to vaccination_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vaccination_type
      @vaccination_type = VaccinationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vaccination_type_params
      params.require(:vaccination_type).permit(:name, :treatment_id)
    end
end
