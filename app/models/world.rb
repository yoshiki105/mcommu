class World < ApplicationRecord
  has_many :spots, dependent: :destroy
end
