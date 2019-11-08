class PaymentsController < ApplicationController
    
    def success

    params
    @listing = Listing.find(params[:listingId])
        @listing.destroy
    raise

    end

end