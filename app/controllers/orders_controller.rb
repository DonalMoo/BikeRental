class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    #get the profile with id 
    @profile = Profile.find(params[:profile_id])

    #access akk the orders for that profile
    #@orders = @profile.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @orders = Order.all
    @profile = Profile.find(params[:profile_id])
    @order = @profile.orders.find(params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new
    @profile = Profile.find(params[:profile_id])
    #asscioate a order object with profile
   # @order = @profile.orders.build
   # @order.bike_id = bike.bike_id

  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @profile = Profile.find(params[:profile_id])
    @order = @profile.orders.build(params.require(:order).permit!)
    @order = @profile.orders.build(params.require(:order).permit!(:bike, :price, :days, :total, :bike_id, :profile_id))
    if @order.save
      redirect_to profile_order_url(@profile, @order)
    else render :action => "new"
    end
  end

   # respond_to do |format|
    #  if @order.save
     #   format.html { redirect_to @order, notice: 'Order was successfully created.' }
      #  format.json { render :show, status: :created, location: @order }
      #else
       # format.html { render :new }
       # format.json { render json: @order.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:bike, :price, :days, :total, :bike_id, :profile_id)
    end
end