class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :car_make, null: false
      t.bigint :price, null: false
      t.integer :colour, null: false
      t.integer :model_year, null: false
      t.string :engine, null: false
      t.integer :top_speed, null: false
      t.text :features, null: false
      t.integer :transmission, null: false
      t.text :condition, null: false
      t.string :location, null: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
