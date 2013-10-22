class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_column :items, :uuid, "char(36)"
  end
end
