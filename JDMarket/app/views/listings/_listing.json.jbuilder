json.extract! listing, :id, :car_make, :price, :colour, :model_year, :engine, :top_speed, :features, :transmission, :condition, :location, :created_at, :updated_at
json.url listing_url(listing, format: :json)
