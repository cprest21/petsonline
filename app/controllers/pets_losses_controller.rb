class PetsLossesController < ApplicationController
  before_action :set_pets_loss, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pets_losses
  # GET /pets_losses.json
  def index
    @pets_losses = PetsLoss.all
  end

  # GET /pets_losses/1
  # GET /pets_losses/1.json
  def show
  end

  # GET /pets_losses/new
  def new
    @pets_loss = PetsLoss.new
  end

  # GET /pets_losses/1/edit
  def edit
  end

  # POST /pets_losses
  # POST /pets_losses.json
  def create
    @pets_loss = PetsLoss.new(pets_loss_params)

    respond_to do |format|
      if @pets_loss.save
        format.html { redirect_to @pets_loss, notice: 'Pets loss was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pets_loss }
      else
        format.html { render action: 'new' }
        format.json { render json: @pets_loss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets_losses/1
  # PATCH/PUT /pets_losses/1.json
  def update
    respond_to do |format|
      if @pets_loss.update(pets_loss_params)
        format.html { redirect_to @pets_loss, notice: 'Pets loss was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pets_loss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets_losses/1
  # DELETE /pets_losses/1.json
  def destroy
    @pets_loss.destroy
    respond_to do |format|
      format.html { redirect_to pets_losses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pets_loss
      @pets_loss = PetsLoss.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pets_loss_params
      params.require(:pets_loss).permit(:loss_history_no, :pet_id, :loss_id)
    end
end
