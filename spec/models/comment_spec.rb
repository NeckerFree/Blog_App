require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.new(name: 'Elio', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Colombia.',
                     post_counter: 0)
    @user.save
    @post = Post.new(author_id: @user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @post.save
    @comment = Comment.create(post_id: @post.id, author_id: @user.id, text: 'This is my fifth comment')
    @comment.save
  end
  context 'Comments validations' do
    it 'validate update_comments_counter method' do
      @comment.update_comments_counter
      expect(@comment.post.comments_counter).to be > 0
    end
  end
end
