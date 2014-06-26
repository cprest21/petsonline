class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pets
  # GET /pets.json
  def index
    @owner = Owner.where(:user_id => current_user.id).first
    @owner = Owner.new if @owner.nil?
    @pets = Pet.all
    render :layout => 'pets'
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    render :layout => 'pets'
  end

  # GET /pets/new
  def new
    @pet = Pet.new
    render :layout => 'pets'
  end

  # GET /pets/1/edit
  def edit
    @type_id = @pet.type.id
    @breed_id = @pet.breed.id
    render :layout => 'pets'
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)
    @owner = Owner.where(:user_id => current_user.id).first
    @pet.owner_id = @owner.id
    #@pet.type_id = @type.id
    #@pet.breed_id = @breed.id
    #@type_id = @pet.type.id
    #@breed_id = @pet.breed.id
    #@breed = Breed.where(:id => params[:breed_id])
    #@pet.type_id = params[:type_id]
    #@pet.breed_id = params[:breed_id]


    #Try commenting the 4 lines below - corrected models breed and pet
    @breed = Breed.where(:id => params[:breed_id]).first
    @pet.breed_id = @breed.id
    @type = Type.where(:id => @breed.type_id).first
    @pet.type_id = @type.id

    #@type = Type.where(:id => params[:type_id])
   

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pet }
      else
        format.html { render action: 'new' }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    #@pet.breed_id = params[:breed_id]
    #@breed = Breed.where(:id => params[:breed_id]).first
    #@pet.breed_id = @breed.id
    #@type = Type.where(:id => @breed.type_id).first
    #@pet.type_id = @type.id
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:id, :type_id, :breed_id, :name, :owner_id, :birth_date, :colour, :sex, :sterilized, :available_to_breed, :deceased, :death_date)
    end
end
