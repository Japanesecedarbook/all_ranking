class Ranking < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 20}
  validates :rank1, presence: true, length: { maximum: 20}
  validates :rank2, presence: true, length: { maximum: 20}
  validates :rank3, presence: true, length: { maximum: 20}
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
