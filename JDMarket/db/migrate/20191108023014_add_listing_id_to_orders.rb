class AddListingIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :listing, foreign_key: true
  end
end
