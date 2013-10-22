class AddColumnsToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :uuid, "char(36)"
  end
end
