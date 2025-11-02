class Post < ApplicationRecord
  belongs_to :user

  scope :last_five_posts, -> { order(created_at: :desc).limit(5) }
end
