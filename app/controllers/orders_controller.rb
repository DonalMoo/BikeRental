require 'my_logger'
require 'calculator'
class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    #get the profile with id 
    @profile = Profile.find(params[:profile_id])
    @orders = Order.all
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
  end

  # GET /orders/1/edit
  def edit
    @orders = Order.all
    @profile = Profile.find(params[:profile_id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @user = User.find(params[:profile_id])
    @profile = Profile.find(params[:profile_id])
    @order = @profile.orders.build
    params[:bike_ids].each do |bike_id|  
    #@order.days = @order.rent_items.days
    @order.rent_items.build(bike_id: bike_id)
    end
    @order.save!

    #retreive the object MyLogger class
    logger = MyLogger.instance
    logger.logInformation("A new order has been created for profile: " + @order.profile.user_id.to_s + " Order number: " + @order.id.to_s)  
    if @order.save
     #use the UserMailer to send a mail to the currently signed in user to tell them they have completed the order successfuly
     UserMailer.order_email(@user).deliver_now
      redirect_to profile_order_url(@profile, @order)
    else 
      render :action => "new"
    end
  end

  #method to calculate total price
  def sum
      @num1 = params[:bike.days]
      @num2 = params[:bike.price]
      @result = Calculator.total(@num1.to_i, @num2.to_i)
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
    @profile_order.destroy
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
