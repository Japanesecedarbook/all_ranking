class Like < ApplicationRecord
  belongs_to :user
  belongs_to :ranking, counter_cache: :likes_count
end
