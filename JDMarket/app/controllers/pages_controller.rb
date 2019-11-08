class PagesController < ApplicationController
    before_action :listing_params, only: [:order]

    def home
        
    end

    def not_found
    
    end

    def index
    end 
    
    def order
        puts params
        #@listing = Listing.find(params[:id])

    end 
    
    



    private

    def listing_params
        params.require(:listing).permit(:car_make, :price, :colour, :model_year, :engine, :top_speed, :features, :transmission, :condition, :location,:category_id, :user_id, :description, pictures: [])
      end

end