class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.integer :user_id
      t.string :phone
      t.string :address
      t.string :zip
      t.text :note
      t.boolean :primary

      t.timestamps
    end
  end
end
