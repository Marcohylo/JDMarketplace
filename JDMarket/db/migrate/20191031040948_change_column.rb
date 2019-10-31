class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :listings, :colour, :string
  end
end
