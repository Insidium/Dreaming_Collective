class Item < ApplicationRecord
  belongs_to :artist
  has_one_attached :item_image

  def self.all_items
    items = Item.all.reverse_order
  end

end
