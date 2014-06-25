class AdvertisersController < ApplicationController
  before_action :set_advertiser, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /advertisers
  # GET /advertisers.json
  def index
    @advertisers = Advertiser.all
    render :layout => 'application'
  end

  # GET /advertisers/1
  # GET /advertisers/1.json
  def show
  end

  # GET /advertisers/new
  def new
    #@advertiser = Advertiser.new
    @advertiser = Advertiser.where(:user_id => current_user.id).first
    @advertiser = Advertiser.new if @advertiser.nil?
  end

  # GET /advertisers/1/edit
  def edit
  end

  # POST /advertisers
  # POST /advertisers.json
  def create
    @advertiser = Advertiser.new(advertiser_params)
    @advertiser.user_id = current_user.id

    respond_to do |format|
      if @advertiser.save
        format.html { redirect_to @advertiser, notice: 'Advertiser was successfully created.' }
        format.json { render action: 'show', status: :created, location: @advertiser }
      else
        format.html { render action: 'new' }
        format.json { render json: @advertiser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisers/1
  # PATCH/PUT /advertisers/1.json
  def update
    respond_to do |format|
      if @advertiser.update(advertiser_params)
        format.html { redirect_to @advertiser, notice: 'Advertiser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @advertiser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisers/1
  # DELETE /advertisers/1.json
  def destroy
    @advertiser.destroy
    respond_to do |format|
      format.html { redirect_to advertisers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertiser
      @advertiser = Advertiser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertiser_params
      params.require(:advertiser).permit(:address_id, :user_id, :name, :lastname)
    end
end
