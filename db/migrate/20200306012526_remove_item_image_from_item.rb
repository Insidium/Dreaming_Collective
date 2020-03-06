class RemoveItemImageFromItem < ActiveRecord::Migration[6.0]
  def change

    remove_column :items, :item_image, :string
  end
end
