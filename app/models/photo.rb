class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :image,   content_type: { in: %w[image/jpeg image/png],
                           message: "must be a valid image format" },
              size:        { less_than: 5.megabytes,
                           message: "should be less than 5MB" }

# 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(gravity: :center, resize:"750x750^", crop:"750x750+0+0").processed
  end
end
