class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  validates :name, presence: true, length: { maximum: 255 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :photo, presence: true, format: { with: %r{\Ahttps?://.+\z}, message: 'must be a valid URL' }

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
