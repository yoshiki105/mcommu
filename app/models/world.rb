class World < ApplicationRecord
  # 関連付け
  has_many :spots, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :users, through: :joins

  # バリデーション
  validates :name, presence: true, length: { maximum: 30 }
end
