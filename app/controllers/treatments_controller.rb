class TreatmentsController < ApplicationController
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /treatments
  # GET /treatments.json
  def index
    @treatments = Treatment.all
    render :layout => 'pets'
  end

  # GET /treatments/1
  # GET /treatments/1.json
  def show
    render :layout => 'pets'
  end

  # GET /treatments/new
  def new
    @treatment = Treatment.new
    render :layout => 'pets'
    #@treatment.veterinarian = Veterinarian.where(:id => params[:veterinarian_id]).first
  end

  # GET /treatments/1/edit
  def edit
    @pet_id = @treatment.pets.first.id
    @veterinarian_id = @treatment.veterinarian.id
    render :layout => 'pets'
    #@veterinarian_id = @treatment.veterinarian.id
  end

  # POST /treatments
  # POST /treatments.json
  def create
    @treatment = Treatment.new(treatment_params)
    @treatment.pets = Pet.where(:id => params[:pet_id])
    #@veterinarian = Veterinarian.where(:id => :veterinarian_id)
    #@treatment.veterinarian_id = @veterinarian.id
    #@treatment.veterinarian = Veterinarian.where(:id => params[:veterinarian_id]).first

    respond_to do |format|
      if @treatment.save
        format.html { redirect_to @treatment, notice: 'Treatment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @treatment }
      else
        format.html { render action: 'new' }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatments/1
  # PATCH/PUT /treatments/1.json
  def update
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to @treatment, notice: 'Treatment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatments/1
  # DELETE /treatments/1.json
  def destroy
    @treatment.destroy
    respond_to do |format|
      format.html { redirect_to treatments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment
      @treatment = Treatment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treatment_params
      params.require(:treatment).permit(:id, :veterinarian_id, :treatment_date, :vaccination, :deworming, :operation, :details)
    end
end
