class Listing < ApplicationRecord
  
  # before_destroy :not_referenced_by_any_line_item
  belongs_to :category, required: false
  has_many_attached :pictures
  has_one :user

  enum transmission: {automatic: 0, manual: 1, not_set: 2}
  
  validates :car_make, :price, :colour, :model_year, :engine, :top_speed, :features, :transmission, :condition, :location, :category_id, presence: true 

  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed."}
  validates :price, numericality: { only_integer: true }
end 
