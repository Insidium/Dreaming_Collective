class Artist < ApplicationRecord
  belongs_to :user
  belongs_to :advocate
  
  has_many :items
end
