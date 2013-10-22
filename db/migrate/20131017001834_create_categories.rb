class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :parent_category_id
      t.integer :order
      t.string :url

      t.timestamps
    end
  end
end
