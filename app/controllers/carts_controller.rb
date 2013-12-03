class CartsController < ApplicationController
  #before_action :get_cart_id
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :index]


  # GET /carts
  # GET /carts.json
  def index
    @total_price = 0
    #session_id = @session_id
    #@cart = Cart.find_by_session_id(session_id)
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    session_id = cart_id
    user_id = current_user.blank? ? nil : current_user.id
    item_id = params[:item_id]
    @cart = Cart.find_by_session_id(session_id)
    if @cart.nil?
      @cart = Cart.create(:user_id => user_id, :session_id => session_id)
      #@cart.save
    end
    @cart_item = @cart.cart_items.create(:item_id => item_id)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cart_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.cart_items.find_by_uuid(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to carts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      session_id = cart_id
      @cart = Cart.find_by_session_id(session_id)
      if @cart.nil?
        @cart = Cart.new
      end
      #@cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id, :session_id)
    end

    def cart_id
      cookies[:cart_id]
    end
end
