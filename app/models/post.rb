class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # A method that updates the posts counter for a user.
  def update_post_counter
    author.update(post_counter: author.posts.count)
  end

  # A method which returns the 5 most recent comments for a given post.
  def recent_comments
    comments.last(5)
    # comments.order(created_at: :desc).limit(5)
  end
end
