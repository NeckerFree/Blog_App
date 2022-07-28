# require 'json'
# # Create at least one user by running the following code:
#    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 0)
#    second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', post_counter: 0)
# # Create at least 4 posts written by one of the users you created by running the following code:
#    first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
#    second_post = Post.create(author_id: first_user.id, title: 'New', text: 'This is my new post', comments_counter: 0, likes_counter: 0)
#    third_post = Post.create(author_id: first_user.id, title: 'Again', text: 'This is my again post', comments_counter: 0, likes_counter: 0)
#    fourth_post = Post.create(author_id: first_user.id, title: 'Recent', text: 'This is my recent post', comments_counter: 0, likes_counter: 0)
#    fifth_post = Post.create(author_id: first_user.id, title: 'Last', text: 'This is my last post', comments_counter: 0, likes_counter: 0)
#    sixth_post = Post.create(author_id: first_user.id, title: 'Final', text: 'This is my final post', comments_counter: 0, likes_counter: 0)
# # Create at least 6 posts comments for one of the posts you created by running the following code:

# first_comment=Comment.create(post_id: first_post.id, author_id: first_user.id, text: 'This is my first comment' )
#    Comment.create(post_id: first_post.id, author_id: first_user.id, text: 'This is my second comment' )
#    Comment.create(post_id: first_post.id, author_id: first_user.id, text: 'This is my third comment' )
#    Comment.create(post_id: first_post.id, author_id: first_user.id, text: 'This is my fourth comment' )
#    Comment.create(post_id: first_post.id, author_id: first_user.id, text: 'This is my fifth comment' )
#    Comment.create(post_id: first_post.id, author_id: first_user.id, text: 'This is my sixth comment' )
#    Comment.create(post_id: first_post.id, author_id: first_user.id, text: 'This is my last comment' )
# # Create likes 
#    first_like= Like.create(post_id: first_post.id, author_id: first_user.id)
#     Like.create(post_id: second_post.id, author_id: second_user.id)

#     puts
#     puts('Recent posts:')
#     puts(first_user.recent_posts.to_json)
#     puts
#     puts('Recent comments:')
#     puts(first_post.recent_comments.to_json)

#     first_post.update_post_counter
#     puts
#     puts('Post counter: ')
#     puts(first_post.author.post_counter)

#     first_comment.update_comments_counter
#     puts('Comments counter: ')
#     puts(first_comment.post.comments_counter)

#     first_like.update_likes_counter
#     puts('likes counter: ')    
#     puts(first_like.post.likes_counter)

