require 'json'
# Create at least one user by running the following code:
   first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
   second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
# Create at least 4 posts written by one of the users you created by running the following code:
   first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
   second_post = Post.create(author: first_user, title: 'New', text: 'This is my new post')
   third_post = Post.create(author: first_user, title: 'Again', text: 'This is my again post')
   fourth_post = Post.create(author: first_user, title: 'Recent', text: 'This is my recent post')
   fifth_post = Post.create(author: first_user, title: 'Last', text: 'This is my last post')
   sixth_post = Post.create(author: second_user, title: 'Final', text: 'This is my final post')
# Create at least 6 posts comments for one of the posts you created by running the following code:
   first_comment=Comment.create(post: first_post, author: first_user, text: 'This is my first comment' )
   Comment.create(post: first_post, author: first_user, text: 'This is my second comment' )
   Comment.create(post: first_post, author: first_user, text: 'This is my third comment' )
   Comment.create(post: first_post, author: first_user, text: 'This is my fourth comment' )
   Comment.create(post: first_post, author: first_user, text: 'This is my fifth comment' )
   Comment.create(post: first_post, author: first_user, text: 'This is my sixth comment' )
   Comment.create(post: first_post, author: second_user, text: 'This is my last comment' )
# Create likes 
   first_like= Like.create(post: first_post, author: first_user)
    Like.create(post: second_post, author: second_user)

    puts
    puts('Recent posts:')
    puts(first_user.recent_posts.to_json)
    puts
    puts('Recent comments:')
    puts(first_post.recent_comments.to_json)

    first_post.update_post_counter
    puts
    puts('Post counter: ')
    puts(first_post.author.post_counter)

    first_comment.update_counter
    puts('Comments counter: ')
    puts(first_comment.post.comments_counter)

    first_like.update_likes_counter
    puts('likes counter: ')    
    puts(first_like.post.likes_counter)

