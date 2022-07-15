require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Elio', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Colombia.',
                     post_counter: 0)
    @user.save
  end
  context 'Users validations' do
    it 'name should not be blank' do
      @user.name = ''
      expect(@user).to_not be_valid
    end

    it 'post counter should be an integer greater than or equal to zero' do
      @user.post_counter = -10
      expect(@user).to_not be_valid
    end

    it 'validate recent_posts method' do
      post1 = Post.new(author_id: @user.id, title: 'My first post', text: 'My first post content',
                       comments_counter: 0, likes_counter: 0)
      post1.save
      post2 = Post.new(author_id: @user.id, title: 'My second post', text: 'My second post content',
                       comments_counter: 0, likes_counter: 0)
      post2.save
      post3 = Post.new(author_id: @user.id, title: 'My third post', text: 'My third post content',
                       comments_counter: 0, likes_counter: 0)
      post3.save
      post4 = Post.new(author_id: @user.id, title: 'My fourth post', text: 'My fourth post content',
                       comments_counter: 0, likes_counter: 0)
      post4.save
      expect(@user.recent_posts).to eq([post4, post3, post2])
    end
  end
end
