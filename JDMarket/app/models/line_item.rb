class LineItem < ApplicationRecord
  belongs_to :listing, required: false
  belongs_to :cart, required: false

  def total_price 
    listing.price.to_i * quantity.to_i
  end 
end
