class VeterinariansController < ApplicationController
  before_action :set_veterinarian, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /veterinarians
  # GET /veterinarians.json
  def index
    @veterinarians = Veterinarian.all
    render :layout => 'pets'
  end

  # GET /veterinarians/1
  # GET /veterinarians/1.json
  def show
    render :layout => 'pets'
  end

  # GET /veterinarians/new
  def new
    @veterinarian = Veterinarian.new
    render :layout => 'pets'
  end

  # GET /veterinarians/1/edit
  def edit
    render :layout => 'pets'
  end

  # POST /veterinarians
  # POST /veterinarians.json
  def create
    @veterinarian = Veterinarian.new(veterinarian_params)
    @city = City.where(:id => params[:city_id])
    @veterinarian.city_id = params[:city_id]

    respond_to do |format|
      if @veterinarian.save
        format.html { redirect_to @veterinarian, notice: 'Veterinarian was successfully created.' }
        format.json { render action: 'show', status: :created, location: @veterinarian }
      else
        format.html { render action: 'new' }
        format.json { render json: @veterinarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veterinarians/1
  # PATCH/PUT /veterinarians/1.json
  def update
    respond_to do |format|
      if @veterinarian.update(veterinarian_params)
        format.html { redirect_to @veterinarian, notice: 'Veterinarian was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @veterinarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veterinarians/1
  # DELETE /veterinarians/1.json
  def destroy
    @veterinarian.destroy
    respond_to do |format|
      format.html { redirect_to veterinarians_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veterinarian
      @veterinarian = Veterinarian.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def veterinarian_params
      params.require(:veterinarian).permit(:id, :address_id, :name, :lastname, :city_id, :street, :street_no, :building, :floor, :office_no, :telephone)
    end
end
