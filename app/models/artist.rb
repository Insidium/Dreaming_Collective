class Artist < ApplicationRecord
  belongs_to :user
  belongs_to :advocate, optional: true
  
  has_many :items
end
