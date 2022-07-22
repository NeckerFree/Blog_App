class PostsController < ApplicationController
  def index
    @user = User.includes(:comments).find(params[:id])
    @posts = User.find(params[:id]).recent_posts
  end

  def show
    @user = User.find(params[:id])
    @post = User.includes(:posts, :comments).find(params[:id]).posts.find(params[:post_id])
    @comments = @post.recent_comments
  end

  def new
    @user = current_user
  end

  def create
    parameters= post_params
    @post= Post.new(author_id: current_user.id, title: parameters[:title], text: parameters[:text], comments_counter: 0, likes_counter: 0)
    @post.save
    redirect_to action: "show", id: current_user.id, post_id: @post.id
  end 
  def createcomment
    puts current_user.id 
    parameters= post_comments
    # puts params[:postid]
    puts parameters[:text]
   
    @comment= Comment.new(post_id: 41, author_id: current_user.id, text: parameters[:text] )
    @comment.save
    # redirect_to action: "show", controller: "posts", id: current_user.id, post_id: @comment.id
    # redirect_to action: "show", controller: "posts"
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end   
  
  def post_comments
    puts params
    params.require(:post).permit(:text)
  end 
end
