class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(:user_id => current_user.id)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @saved_addresses = ShippingAddress.where(:user_id => current_user.id).all

    if(@saved_addresses.length == 0)
      @saved_addresses = Array.new
      @saved_addresses[0] = ShippingAddress.new
      @saved_addresses[0].user_id = current_user.id
      @saved_addresses[0].id = -1
      @saved_addresses[0].address = ''
      @shipping_address = ShippingAddress.new
      @shipping_address.user_id = current_user.id
      @address_1 = ""
      @address_2 = ""
    else
      @shipping_address = current_user.shipping_addresses.order('shipping_addresses.primary DESC').first
      @address_1 = @shipping_address.address.split("\n")[0]
      @address_2 = @shipping_address.address.split("\n")[1]
      #ShippingAddress.where(:user_id => current_user.id).all
      #@shipping_address = @saved_addresses.reorder('primary DESC').first
    end
    @billing_address = @shipping_address

  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    #@order = Order.new(order_params)
    #puts params[:shipping_address]
    #puts address_params
    @address = ShippingAddress.new(address_params)
    @address.save!
    #puts cart_id
    @cart = Cart.find_by_session_id(cart_id)
    total_price = 0
    @cart.cart_items.each do |c_item|
      total_price = total_price + c_item.item.price
    end

    @order = Order.new(:shipping_address_id => @address.id, :price => total_price, :cart_id => @cart.id, :user_id => current_user.id)
    @order.save!
    clear_cart
    #render json: address_params
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
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
      params.require(:order).permit(:user_id, :price, :shipping_address_id, :shipped, :tracking_number, :via, :note, :cart_id)
    end

    def address_params
      params[:shipping_address][:address] = params[:shipping_address][:address_1] + "\n" + params[:shipping_address][:address_2]
      params[:shipping_address][:user_id] = current_user.id
      params.require(:shipping_address).permit(:address, :city, :state, :zip, :ship_to, :note, :phone, :primary, :user_id)
    end


end
