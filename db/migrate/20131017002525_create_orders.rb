class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.float :price
      t.integer :shipping_address_id
      t.boolean :shipped
      t.string :tracking_number
      t.string :via
      t.text :note
      t.integer :cart_id

      t.timestamps
    end
  end
end
