class ListingsController < ApplicationController
    load_and_authorize_resource
    skip_authorize_resource :only => :show 
    before_action :authenticate_user!
    before_action :set_listing, only: [:show, :order]
    before_action :set_user_listing, only: [:edit, :update, :destroy]
    
    # GET /listings
    # GET /listings.json
    def index
      # @listings = Listing.all
      @q = Listing.ransack(params[:q])
      @listings = @q.result(distinct: true)
    end

    # GET /listings/new
    def new
      @listing = Listing.new
    end

    def show
      session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          customer_email: current_user.email,
          line_items: [{
              name: @listing.car_make,
              description: @listing.description,
              amount: @listing.price * 100,
              currency: 'aud',
              quantity: 1,
          }],
          payment_intent_data: {
              metadata: {
                  user_id: current_user.id,
                  listing_id: @listing.id
              }
          },
          success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
          cancel_url: "#{root_url}listings"
      )
  
      @session_id = session.id
  end
  
    # GET /listings/1/edit
    def edit
    end
  
    # POST /listings
    # POST /listings.json
    def create
      @listing = Listing.new(listing_params)
      @listing.user_id = current_user.id
      # @listing.user_id = current_user.id

      respond_to do |format|
        if @listing.save
          format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
          format.json { render :show, status: :created, location: @listing  }
        else
          format.html { render :new }
          format.json { render json: @listing.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /listings/1
    # PATCH/PUT /listings/1.json
    def update
      respond_to do |format|
        if @listing.update(listing_params)
          format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
          format.json { render :show, status: :ok, location: @listing }
        else
          format.html { render :edit }
          format.json { render json: @listing.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /listings/1
    # DELETE /listings/1.json
    def destroy
      @listing.destroy
      respond_to do |format|
        format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_listing
        @listing = Listing.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def listing_params
        params.require(:listing).permit(:car_make, :price, :colour, :model_year, :engine, :top_speed, :features, :transmission, :condition, :location,:category_id, :user_id, :description, pictures: [])
      end

      def set_user_listing
        id = params[:id]
        @listing = current_user.listings.find_by_id(id)
    
        if @listing == nil
            redirect_to listings_path
        end
      end

  end
  
  