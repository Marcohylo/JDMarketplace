class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.string :suburb
      t.integer :postcode
      t.integer :state
      t.string :first_name
      t.string :last_name
      t.bigint :phone_number
      t.boolean :admin
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
