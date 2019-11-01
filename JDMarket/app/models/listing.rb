class Listing < ApplicationRecord
  
  before_destroy :not_referenced_by_any_line_item
  belongs_to :category
  has_one_attached :picture
  has_many :line_items

  validates :car_make, :price, :colour, :model_year, :engine, :top_speed, :features, :transmission, :condition, :location, :category_id, presence: true 

  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed."}
  validates :description, length: {maximum: 140, too_long: "%{count} characters is the maximum allowed."}
  validates :price, numericality: { only_integers: true }

  private 

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(base:"Line items present")
      throw:abort
    end 
  end
end 