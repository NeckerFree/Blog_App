require 'rails_helper'

RSpec.describe 'User post index page', type: :system do
  before(:all) do
    Post.destroy_all
    User.destroy_all
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

  it 'I can see the users profile picture.' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_css("img[src*='https://unsplash.com/photos/Photo1']")
  end
  it 'I can see the users username.' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('Tom')
  end
  it 'I can see the number of posts the user has written.' do
    @first_post.update_post_counter
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('Number of posts: 4')
  end
  it 'I can see a posts title.' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('Post #', count: 4)
  end
  it 'I can see some of the posts body.' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('Likes:0', count: 4)
  end
  it 'I can see the first comments on a post.' do
    @first_comment = Comment.create(post_id: @first_post.id, author_id: @first_user.id,
                                    text: 'This is my first comment')
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content(@first_comment.text)
  end
  it 'I can see how many comments a post has.' do
    @first_comment = Comment.create(post_id: @first_post.id, author_id: @first_user.id,
                                    text: 'This is my first comment')
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('Comments:1')
  end
  it 'I can see how many likes a post has.' do
    Like.create(post_id: @first_post.id, author_id: @first_user.id)
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('Likes:1')
  end
  it 'I can see a section for pagination if there are more posts than fit on the view.' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_button('Pagination')
  end
  it 'When I click on a post, it redirects me to that posts show page.' do
    visit "/users/#{@first_user.id}/posts"
    click_link("Post ##{@first_post.id}")
    expect(page).to have_content('Post #')
  end
end
