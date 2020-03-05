class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :artist, null: false, foreign_key: true
      t.string :name
      t.string :category
      t.decimal :price, precision: 8, scale: 2
      t.string :description
      t.string :item_image

      t.timestamps
    end
  end
end
