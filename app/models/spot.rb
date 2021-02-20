class Spot < ApplicationRecord
  # 関連付け
  belongs_to :world

  # バリデーション
  validates :place, presence: true, length: { maximum: 20 }
  validates :dimension, presence: true, inclusion: { in: %w[overworld nether] }
  validates :memo, length: { maximum: 144 }
end
