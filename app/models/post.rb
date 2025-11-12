class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  scope :last_five_posts, -> { order(created_at: :desc).limit(5) }
end
