class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
    render :layout => 'pets'
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    render :layout => 'pets'
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    render :layout => 'pets'
  end

  # GET /sales/1/edit
  def edit
    render :layout => 'pets'
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    @ow = Owner.where(:user_id => current_user.id).first
    #@pet = Pet.where(:owner_id => @ow.id)
    #@sale.pet_id = @pet.id

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sale }
      else
        format.html { render action: 'new' }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:pet_id, :price, :sold, :date_sold, :details)
    end
end
