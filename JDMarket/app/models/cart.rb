class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy

    def add_listing(listing)
        current_item = line.items.find_by(listing_id: listing.id)
        if current_item
            current_item.increment(:quantity)
        else
            current_item = line_items.build(listing_id: listing_id)
        end 
        current_item
    end

    def total_price 
        line_items.to.a.sum { |item| item.total.price}
    end 
end 