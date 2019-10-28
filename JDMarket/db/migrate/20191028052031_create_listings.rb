class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :car_make
      t.bigint :price
      t.integer :colour
      t.integer :model_year
      t.string :engine
      t.integer :top_speed
      t.text :features
      t.integer :transmission
      t.text :condition
      t.string :location
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
