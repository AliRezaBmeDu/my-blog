class User < ApplicationRecord
    has_many :posts
    has_many :likes
    has_many :comments

    validates :name, presence: true, length: { maximum: 255 }
    validates :photo, presence: true, format: { with: /\Ahttps?:\/\/.+\z/, message: 'must be a valid URL' }
    validates :bio, length: { maximum: 1000 }
end
