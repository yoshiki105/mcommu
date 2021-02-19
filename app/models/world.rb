class World < ApplicationRecord
  has_many :spots, dependent: :destroy
  has_many :users, through: :joins
  has_many :joins, dependent: :destroy
end
