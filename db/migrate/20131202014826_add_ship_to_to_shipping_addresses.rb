class AddShipToToShippingAddresses < ActiveRecord::Migration
  def change
    add_column :shipping_addresses, :ship_to, :string
    add_column :shipping_addresses, :state, :string
  end
end
