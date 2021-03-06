class LossesController < ApplicationController
  before_action :set_loss, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /losses
  # GET /losses.json
  def index
    @losses = Loss.all
    render :layout => 'pets'
  end

  # GET /losses/1
  # GET /losses/1.json
  def show
    #@loss.reload
    #Esto devuelve un array de losses, por más que solo tenga un elemento el array
    # @loss = Loss.where(:id => params[:id])

    # Devuelve un solo elemento
    @loss = Loss.find(params[:id])
    # ¿Por qué asignar esto acá? Ya esta en la base de datos!
    #@loss.pets = Pet.where(:id => params[:pet_id])
    render :layout => 'pets'
  end

  # GET /losses/new
  def new
    @loss = Loss.new
    render :layout => 'pets'
  end

  # GET /losses/1/edit
  def edit
    #@loss = Loss.find(params[:id])
    @pet_id = @loss.pets.first.id
    render :layout => 'pets'
  end

  # POST /losses
  # POST /losses.json
  def create
    @loss = Loss.new(loss_params)
    @loss.pets = Pet.where(:id => params[:pet_id])

    respond_to do |format|
      if @loss.save
        format.html { redirect_to @loss, notice: 'Loss was successfully created.' }
        format.json { render action: 'show', status: :created, location: @loss }
      else
        format.html { render action: 'new' }
        format.json { render json: @loss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /losses/1
  # PATCH/PUT /losses/1.json
  def update
    @loss.pets = Pet.where(:id => params[:pet_id])
    respond_to do |format|
      if @loss.update(loss_params)
        format.html { redirect_to @loss, notice: 'Loss was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @loss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /losses/1
  # DELETE /losses/1.json
  def destroy
    @loss.destroy
    respond_to do |format|
      format.html { redirect_to losses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loss
      @loss = Loss.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loss_params
      params.require(:loss).permit(:id, :lost, :finder_name, :finder_contact_details, :date_lost, :place_lost, :date_found, :place_found, :pet_id)
    end
end
