require 'rails_helper'

# user show page:

# I can see the user's profile picture.
# I can see the user's username.
# I can see the number of posts the user has written.
# I can see the user's bio.
# I can see the user's first 3 posts.
# I can see a button that lets me view all of a user's posts.
# When I click a user's post, it redirects me to that post's show page.
# When I click to see all posts, it redirects me to the user's post's index page.

RSpec.describe 'User index page', type: :system do
    before(:all) do
        User.destroy_all
        @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/Photo1', bio: 'Teacher from Mexico.', post_counter: 0)
        @second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/Photo2', bio: 'Teacher from Poland.', post_counter: 0)
    end
         
      it 'I can see the users profile picture.' do
        visit "/users/#{@first_user.id}"
        expect(page).to have_css("img[src*='https://unsplash.com/photos/Photo1']")
        visit "/users/#{@second_user.id}"
        expect(page).to have_css("img[src*='https://unsplash.com/photos/Photo2']")
      end
      it 'I can see the username of all other users' do
        visit "/users/#{ @first_user.id}"
        expect(page).to have_content('Tom')
        visit "/users/#{@second_user.id}"
        expect(page).to have_content('Lili')
      end
      it 'I can see the number of posts the user has written.' do
        first_post = Post.create(author_id: @first_user.id, title: 'Hello', text: 'This is my first post',
                                 comments_counter: 0, likes_counter: 0)
        first_post.update_posts_counter
        visit "/users/#{ @first_user.id}"
        expect(page).to have_content('Number of posts: 1')
        visit "/users/#{ @second_user.id}"
        expect(page).to have_content('Number of posts: 0')
      end
    
      it "I can see the user's bio." do
        visit "/users/#{ @first_user.id}"
        expect(page).to have_content('Bio')
        visit "/users/#{@second_user.id}"
        expect(page).to have_content('Bio')
      end

      it "I can see the user's first 3 posts." do
        first_post = Post.create(author_id: @first_user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
        second_post = Post.create(author_id: @first_user.id, title: 'New', text: 'This is my new post', comments_counter: 0, likes_counter: 0)
        third_post = Post.create(author_id: @first_user.id, title: 'Again', text: 'This is my again post', comments_counter: 0, likes_counter: 0)
        fourth_post = Post.create(author_id: @first_user.id, title: 'Recent', text: 'This is my recent post', comments_counter: 0, likes_counter: 0)
        fifth_post = Post.create(author_id: @first_user.id, title: 'Last', text: 'This is my last post', comments_counter: 0, likes_counter: 0)
        sixth_post = Post.create(author_id: @second_user.id, title: 'Final', text: 'This is my final post', comments_counter: 0, likes_counter: 0)
         visit "/users/#{ @first_user.id}"
        expect(page).to have_content('Post #', maximum:3) 
        visit "/users/#{ @second_user.id}"
        expect(page).to have_content('Post #', maximum:3) 
      end  

     it "I can see a button that lets me view all of a user's posts." do
       first_post = Post.create(author_id: @first_user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
       visit "/users/#{ @first_user.id}"
      expect(page).to have_button('See All Posts')
     end

     it "When I click a user's post, it redirects me to that post's show page." do
      visit "/users/#{ @first_user.id}"
      link= find_link('Post #').first
      click_link(link)
      expect(page).to have_content('Post #') 
     end
     
     it "When I click to see all posts, it redirects me to the user's post's index page." do
      first_post = Post.create(author_id: @first_user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
      second_post = Post.create(author_id: @first_user.id, title: 'New', text: 'This is my new post', comments_counter: 0, likes_counter: 0)
      third_post = Post.create(author_id: @first_user.id, title: 'Again', text: 'This is my again post', comments_counter: 0, likes_counter: 0)
      fourth_post = Post.create(author_id: @first_user.id, title: 'Recent', text: 'This is my recent post', comments_counter: 0, likes_counter: 0)
      fifth_post = Post.create(author_id: @first_user.id, title: 'Last', text: 'This is my last post', comments_counter: 0, likes_counter: 0)
    visit "/users/#{ @first_user.id}"
    click_button 'See All Posts'
    expect(page).to have_content('Post #', minimum:1) 
   end

end 
