class Item < ApplicationRecord
  belongs_to :artist
  has_one :order
  has_one_attached :item_image

  # Show all items, sorting by latest added
  def self.all_items
    items = Item.all.reverse_order
  end

end
