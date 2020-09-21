class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :posts, through: :comments
    has_many :categories, through: :posts
end
