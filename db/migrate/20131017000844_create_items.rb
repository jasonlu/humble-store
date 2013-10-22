class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :category_id
      t.string :title
      t.string :cover_image
      t.text :description
      t.text :briefing
      t.float :price
      t.integer :stock

      t.timestamps
    end
  end
end
