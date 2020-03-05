class Artist < ApplicationRecord
  belongs_to :user
  belongs_to :advocate
end
