class AddUuidToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :uuid, "char(36)" #, default: 'uuid()'
  end
end
