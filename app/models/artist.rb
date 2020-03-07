class Artist < ApplicationRecord
  belongs_to :user
  belongs_to :advocate, optional: true
  
  has_one_attached :artist_image
  has_many :items
end
