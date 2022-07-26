require 'rails_helper'

RSpec.describe 'Post show page', type: :system do
  before(:all) do
    User.destroy_all
    Post.destroy_all
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/Photo1',
                              bio: 'Teacher from Mexico.', post_counter: 0)
    @first_post = Post.create(author_id: @first_user.id, title: 'Hello', text: 'This is my first post',
                              comments_counter: 0, likes_counter: 0)
    Post.create(author_id: @first_user.id, title: 'New', text: 'This is my new post',
                comments_counter: 0, likes_counter: 0)
    Post.create(author_id: @first_user.id, title: 'Again', text: 'This is my again post',
                comments_counter: 0, likes_counter: 0)
    Post.create(author_id: @first_user.id, title: 'Recent', text: 'This is my recent post',
                comments_counter: 0, likes_counter: 0)
  end

  it 'I can see the posts title.' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.title.to_s)
  end
  it 'I can see who wrote the post.' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content("Post # #{@first_post.id} by #{@first_user.name}")
  end
  it 'I can see how many comments it has.' do
    first_comment = Comment.create(post_id: @first_post.id, author_id: @first_user.id,
                                   text: 'This is my first comment')
    first_comment.update_comments_counter
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content('Comments:1')
  end
  it 'I can see how many likes it has.' do
    Like.create(post_id: @first_post.id, author_id: @first_user.id)
    first_like = Like.create(post_id: @first_post.id, author_id: @first_user.id)
    first_like.update_likes_counter
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content('Likes:2')
  end
  it 'I can see the post body.' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.text)
  end
  it 'I can see the username of each commentor.' do
    Comment.create(post_id: @first_post.id, author_id: @first_user.id,
                   text: 'This is my first comment')
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content("Username: #{@first_user.name}")
  end
  it 'I can see the comment each commentor left.' do
    first_comment = Comment.create(post_id: @first_post.id, author_id: @first_user.id,
                                   text: 'This is my first comment')
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(first_comment.text)
  end
end
