class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new

    #put if statement here regarding owners/advertisers
    if current_user.role == "owner"
      @owner = Owner.where(:user_id => current_user.id).first 
      render :layout => 'owners'
    elsif current_user.role == "advertiser"
      @advertiser = Advertiser.where(:user_id => current_user.id).first
      render :layout => 'advertisers'
    end
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)
    @city = City.where(:id => params[:city_id])
    @address.city_id = params[:city_id]
    #@owner = Owner.where(:user_id => current_user.id).first
    #@owner.address_id = params[:address_id]
    #@owner.save

    respond_to do |format|
      if @address.save
        @address.reload
        if current_user.role == "owner"
          @owner = Owner.where(:user_id => current_user.id).first
          @owner.address_id = @address.id
          @owner.save
        elsif current_user.role == "advertiser"
          @advertiser = Advertiser.where(:user_id => current_user.id).first
          @advertiser.address_id = @address.id
          @advertiser.save
        end
        if current_user.role == "owner"
          format.html { redirect_to new_owner_path, notice: 'Address was successfully created.' }
          format.json { render action: 'show', status: :created, location: @address }
        elsif current_user.role == "advertiser"
          format.html { redirect_to new_advertiser_path, notice: 'Address was successfully created.' }
          format.json { render action: 'show', status: :created, location: @address }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    #@city = City.where(:id => params[:city_id])
    #@address.city_id = params[:city_id]
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:city_id, :street, :street_no, :apartment_no, :floor, :telephone, :office_no, :building)
    end
end
