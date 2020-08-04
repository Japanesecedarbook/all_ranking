class Comment < ApplicationRecord
  belongs_to :ranking
  belongs_to :user

  validates :text, presence: true
end
