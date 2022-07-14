class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :post

    # A method that updates the comments counter for a post.
    def update_counter(post)
        
    end
end    