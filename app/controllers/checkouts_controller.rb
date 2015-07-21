class CheckoutsController < ApplicationController
  before_action :set_checkout, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:index]
  before_action :authorize, only: [:new]
  before_action :authorize_checkout, only: [:show, :edit, :update, :destroy]
  before_action :validate_cart_has_items, only: [:new]

  # GET /checkouts
  # GET /checkouts.json
  def index
    @checkouts = Checkout.all
  end

  # GET /checkouts/1
  # GET /checkouts/1.json
  def show
  end

  # GET /checkouts/new
  def new
    @checkout = Checkout.new
  end

  # GET /checkouts/1/edit
  def edit
  end

  # POST /checkouts
  # POST /checkouts.json
  def create
    @checkout = Checkout.new(checkout_params)

   # @checkout.cart_id = current_user.carts.last.id
   # @checkout.user_id = current_user.id

    @checkout.cart = current_user.carts.last
   # @checkout.user = current_user
    @checkout.user = nil


    respond_to do |format|
      if @checkout.save

        @cart = Cart.find(@checkout.cart_id)
        @cart.status = false
        @cart.save

        @cart2 = current_user.carts.create(subtotal: 0, status: true)
        @cart2.save

        if @checkout.saved

          current_user.checkout = nil

          @checkout2 = Checkout.new(checkout_params, user: current_user)
          # @checkout2.user = current_user
          current_user.checkout = @checkout2
          current_user.save
          @checkout2.save
        end


        format.html { redirect_to @cart, notice: 'Thanks for buying those things!' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkouts/1
  # PATCH/PUT /checkouts/1.json
  def update
    respond_to do |format|
      if @checkout.update(checkout_params)
        format.html { redirect_to @checkout.user, notice: 'Information was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkout.user }
      else
        format.html { render :edit }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkouts/1
  # DELETE /checkouts/1.json
  def destroy
    @checkout.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Saved info was successfully DESTROYED.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkout
      @checkout = Checkout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkout_params
      params.require(:checkout).permit(:shipname, :shipstreet, :shipcity, :billname, :billstreet, :billcity, :cardnumber, :cardmonth, :cardyear, :cardcvv, :user, :cart, :shipzip, :cardzip, :shipstate, :cardstate, :cardtype, :saved)
    end
end
