class AddRemovedToShippingAddresses < ActiveRecord::Migration
  def change
    add_column :shipping_addresses, :removed, :boolean
  end
end
