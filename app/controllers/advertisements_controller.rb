class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /advertisements
  # GET /advertisements.json
  def index
    @advertiser = Advertiser.where(:user_id => current_user.id).first
    @advertiser = Advertiser.new if @advertiser.nil?
    @owner = Owner.where(:user_id => current_user.id).first
    @owner = Owner.new if @owner.nil?
    if current_user.role == "owner"
      @advertisements = Advertisement.all
      render :layout => 'owners'
    elsif current_user.role == "advertiser"
      @advertisements = Advertisement.all
      render :layout => 'advertisers'
    end
  end

  # GET /advertisements/1
  # GET /advertisements/1.json
  def show
    @advertiser = Advertiser.where(:user_id => current_user.id).first
    @advertiser = Advertiser.new if @advertiser.nil?
    @owner = Owner.where(:user_id => current_user.id).first
    @owner = Owner.new if @owner.nil?
    #@advertisement = Advertisement.find(:id => params[:id])
    #@user = User.where(:id => current_user.id).first
    if current_user.role == "owner"
      #@owner = Owner.where(:user_id => params[:user_id] )
      render :layout => 'owners'
    elsif current_user.role == "advertiser"
      #@advertiser = Advertiser.where(:user_id => advertisement.user_id).first
      render :layout => 'advertisers'
    end
    #@advertiser = Advertiser.where(:user_id => current_user.id).first
  end

  # GET /advertisements/new
  def new
    @advertisement = Advertisement.new
    if current_user.role == "owner"
      @owner = Owner.where(:user_id => current_user.id).first 
      render :layout => 'owners'
    elsif current_user.role == "advertiser"
      @advertiser = Advertiser.where(:user_id => current_user.id).first
      render :layout => 'advertisers'
    end
  end

  # GET /advertisements/1/edit
  def edit
  end

  # POST /advertisements
  # POST /advertisements.json
  def create
    @advertisement = Advertisement.new(advertisement_params)
    #@advertisement.placement_date = Time.now

    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to @advertisement, notice: 'Advertisement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @advertisement }
      else
        format.html { render action: 'new' }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisements/1
  # PATCH/PUT /advertisements/1.json
  def update
    #@advertisement.placement_date = Time.now
    respond_to do |format|
      if @advertisement.update(advertisement_params)
        format.html { redirect_to @advertisement, notice: 'Advertisement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisements/1
  # DELETE /advertisements/1.json
  def destroy
    @advertisement.destroy
    respond_to do |format|
      format.html { redirect_to advertisements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertisement
      @advertisement = Advertisement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertisement_params
      params.require(:advertisement).permit(:user_id, :details, :placement_date)
    end
end
