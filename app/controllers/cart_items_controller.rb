class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:create]
  before_action :authorize_admin, only: [:show, :edit, :update, :destroy]

  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    @cart_item = CartItem.new(product_id: cart_item_params[:product_id], cart_id: cart_item_params[:cart_id])

    # @cart_item = CartItem.new(cart_item_params)


    @cart = Cart.find(cart_item_params[:cart_id])

    # @cart = cart_item_params[:cart_id]
    # @cart = @cart_item.cart



      respond_to do |format|
        if @cart_item.save

          # @cart = @cart_item.cart_id

          @cart.update_subtotal

          format.html { redirect_to @cart, notice: 'You put the thing in your cart. You\'re awesome.' }
          format.json { render :show, status: :created, location: @cart }
        else
          format.html { render :new }
          format.json { render json: @cart_item.errors, status: :unprocessable_entity }
        end
      end



  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy

    @cart = @cart_item.cart
    @cart_item.destroy
    @cart.update_subtotal

    respond_to do |format|
      format.html { redirect_to @cart, notice: 'I can\'t believe you took that thing out of your cart. Jerk.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
      params.permit(:product_id, :cart_id)
    end


end
