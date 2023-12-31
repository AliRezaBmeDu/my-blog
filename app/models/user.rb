class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add the role attribute
  enum role: %i[user admin]

  has_many :posts, foreign_key: :author_id
  has_many :likes
  has_many :comments, foreign_key: :author_id

  validates :name, presence: true, length: { maximum: 255 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  attribute :posts_counter, :integer, default: 0

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def first_three_posts
    posts.order(created_at: :asc).limit(3)
  end

  def confirmed?
    confirmed_at.present?
  end

  def admin?
    role == 'admin'
  end
end
