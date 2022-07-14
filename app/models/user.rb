class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  validates :name, presence: true, length: { in: 6..25 }
  validates :post_counter, numericality: { only_integer: true, greater_than: 0 }
end
