class Ranking < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20}
  validates :rank1, presence: true, length: { maximum: 20}
  validates :rank2, presence: true, length: { maximum: 20}
  validates :rank3, presence: true, length: { maximum: 20}
  validates :image, presence: true

  def like_by?(user)
    likes.where(user_id: user.id).exists?
  end

  mount_uploader :image, ImageUploader
end
