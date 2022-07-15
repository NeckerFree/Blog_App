require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.new(name: 'Elio', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Colombia.',
                     post_counter: 0)
    @user.save
    @post = Post.new(author_id: @user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @post.save
  end
  context 'Post validations' do
    it 'title should not be blank' do
      @post.title = ''
      expect(@post).to_not be_valid
    end

    it 'title should not exceed 250 characters' do
      @post.title = 'x' * 251
      expect(@post).to_not be_valid
    end

    it 'comments counter should be an integer greater than or equal to zero' do
      @post.comments_counter = -10
      expect(@post).to_not be_valid
    end

    it 'likes counter should be an integer greater than or equal to zero' do
      @post.likes_counter = -10
      expect(@post).to_not be_valid
    end

    it 'update_post_counter' do
      @post.update_post_counter
      @post.save
       expect(@post.author.post_counter).to be > 0
    end
    it 'recent comments' do
      comment1 = Comment.new(text: 'This is my first comment', post_id: @post.id, author_id: @user.id)
      comment1.save
      comment2 = Comment.new(text: 'This is my second comment', post_id: @post.id, author_id: @user.id)
      comment2.save
      comment3 = Comment.new(text: 'This is my third comment', post_id: @post.id, author_id: @user.id)
      comment3.save
      comment4 = Comment.new(text: 'This is my fourth comment', post_id: @post.id, author_id: @user.id)
      comment4.save
      comment5 = Comment.new(text: 'This is my fifth comment', post_id: @post.id, author_id: @user.id)
      comment5.save
      expect(@post.recent_comments).to eq([comment1, comment2, comment3, comment4, comment5])
    end
  end
end
