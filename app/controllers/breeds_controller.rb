class BreedsController < ApplicationController
  before_action :set_breed, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /breeds
  # GET /breeds.json
  def index
    unless params[:type_id].nil?
    #@breeds = Breed.all
      @breeds = Breed.where(:type_id => params[:type_id])
    else
      @breeds = Breed.all
    end
  end

  # GET /breeds/1
  # GET /breeds/1.json
  def show
  end

  # GET /breeds/new
  def new
    @breed = Breed.new
  end

  # GET /breeds/1/edit
  def edit
  end

  # POST /breeds
  # POST /breeds.json
  def create
    @breed = Breed.new(breed_params)
    #@type = Type.find(:id => params[:type_id])

    respond_to do |format|
      if @breed.save
        format.html { redirect_to @breed, notice: 'Breed was successfully created.' }
        format.json { render action: 'show', status: :created, location: @breed }
      else
        format.html { render action: 'new' }
        format.json { render json: @breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breeds/1
  # PATCH/PUT /breeds/1.json
  def update
    respond_to do |format|
      if @breed.update(breed_params)
        format.html { redirect_to @breed, notice: 'Breed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breeds/1
  # DELETE /breeds/1.json
  def destroy
    @breed.destroy
    respond_to do |format|
      format.html { redirect_to breeds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breed
      @breed = Breed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def breed_params
      params.require(:breed).permit(:name, :type_id)
    end
end
