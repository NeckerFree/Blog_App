class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments  
    has_many :likes

    # A method that updates the posts counter for a user.
    def update_post_counter(user)
        
    end

    # A method which returns the 5 most recent comments for a given post.
    def recent_comments(post)
        
    end
end     