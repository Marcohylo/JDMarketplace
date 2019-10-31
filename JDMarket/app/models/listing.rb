class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :user 
  mount_uploader :image, ImageUploader

  validates :car_make, :price, :colour, :model_year, :engine, :top_speed, :features, :transmission, :condition, :location, :category_id, presence: true 

  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed."}
  validates :title, length: {maximum: 140, too_long: "%{count} characters is the maximum allowed."}
  validates :price, numericality: { only_integers: true }

  CAR_MAKE = %w{ Mazda Toyota Mitsubishi Subaru Honda Nissan Suzuki }
  CONDITION = %w{ New Excellent Mint Used Fair Poor}
  
end
