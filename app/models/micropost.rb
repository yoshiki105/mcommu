class Micropost < ApplicationRecord
  # 関連付け
  belongs_to :user
  has_one_attached :image

  # 取得順序
  default_scope -> { order(created_at: :desc) }

  # バリデーション
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image, content_type: { in: %i[png jpg jpeg gif], message: '画像が無効な形式です。' },
                    size: { less_than: 1.megabytes, message: '画像容量は5MB以下にしてください。' }

  # 表示用にリサイズされた画像を返す
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
