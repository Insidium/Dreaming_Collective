class Item < ApplicationRecord
  belongs_to :artist
  has_one_attached :item_image

  def self.order_by_artist_name(artist)
    items = []
    Artist.all.order(:last_name).each do | artist |
      items += artist.items.order(:name)
    end
    return items
  end

end
